{ pkgs, inputs, lib, ... }:
let
  nixpkgs-stable = import inputs.nixpkgs-stable { inherit (pkgs) system; };
in
{
  systemd.services.qbittorrent = {
    vpnConfinement = {
      enable = true;
      vpnNamespace = "AirVPN";
    };
    
    bindsTo = [ "AirVPN.service" ];
    after = [ "AirVPN.service" ];

    serviceConfig = {
      UMask = lib.mkForce "0002";  # files created as 664, dirs as 775
    };

    preStart = ''
      categoriesFile="/var/lib/qBittorrent/qBittorrent/config/categories.json"
      mkdir -p "$(dirname $categoriesFile)"
      cat > "$categoriesFile" <<'EOF'
      {
          "radarr": {
              "save_path": "/Warehouse/Media/Downloads/radarr"
          },
          "sonarr": {
              "save_path": "/Warehouse/Media/Downloads/sonarr"
          }
      }
      EOF
    '';
  };

  services.qbittorrent = {
    enable = true;
    webuiPort = 21352;
    torrentingPort = 21353;
    package = nixpkgs-stable.qbittorrent-nox;
    serverConfig = {
      "BitTorrent" = {
        # Disable Torrent Queueing Limits
        "Session\\QueueingSystemEnabled" = "false";

        # Disale Manual Torrent Management Mode (This changes it to automatic)
        "Session\\DisableAutoTMMByDefault" = "false";
        
        # Exclude downloading files with the following file types
        "Session\\ExcludedFileNames" = "*.bat, *.bin, *.bmp, *.cmd, *.com, *.db, *.diz, *.dll, *.dmg, *.etc, *.exe, *.gif, *.ico, *.ini, *.iso, *.jar, *.js, *.link, *.lnk, *.msi, *.perl, *.php, *.pl, *.ps1, *.psc1, *.psd1, *.psm1, *.py, *.pyd, *.rb, *.reg, *.run, *.scr, *.sh, *.sql, *.text, *.thumb, *.torrent, *.url, *.vbs, *.wsf, *.xml, *.zipx, *.arj";
        "ExcludedFileNamesEnabled" = "true";

        # Automatically stop torrents after 10 days of seeding
        "Session\\MaxRatioAction" = "0"; # 0: Stop torrent, 3: Remove torrent and its files
        "Session\\GlobalMaxSeedingMinutes" = "14400";

        # Look for matching torrent hashes in other trackers (speeds up downloads)
        "Session\\AdditionalTrackersEnabled" = "true";
        "Session\\AdditionalTrackersURL" = "https://raw.githubusercontent.com/ngosang/trackerslist/refs/heads/master/trackers_best.txt";
      };

      "Preferences" = {
        "WebUI\\Address" = "192.168.15.1";
        "WebUI\\Port" = "21352";
        "Connection\\PortRangeMin" = "21353";
        
        "WebUI\\UseCustomTheme" = "false";
        "WebUI\\Theme" = "dark";
        
        # Fix that might have been causing seeding to stall
        "WebUI\\BanDuration" = "3600";
        "WebUI\\MaxAuthenticationFailCount" = "0";
        
        # This prevents my downloads from saving to the main drive
        # & instead download directly to the big drive
        "Downloads\\SavePath" = "/Warehouse/Media/Downloads/";
        "Downloads\\TempPath" = "/Warehouse/Media/Downloads/Incomplete/";
        "Downloads\\TempPathEnabled" = "true";

        # Persist login every time the server reboots
        "WebUI\\Username" = "QBittorrentHomie";
        "WebUI\\Password_PBKDF2" = "@ByteArray(VpjJ4KxQZyGwDS+kCZfQ8A==:qdrvU9n+Ndttl7d8IijLTIbgmVe1GmR6dX0v3VfhEax27HO0qbYsgXeznCRPYV/txZDOkjBJkSPm6Nf4sm6A/A==)";
      };
    };
  };
}
