{
  vpnNamespaces.AirVPN = {
    enable = true;
    wireguardConfigFile = "/etc/vpn/AirVPN_AllServers.conf";

    accessibleFrom = [ "192.168.1.0/24" ];

    portMappings = [{ from = 2283; to = 8080; }];

    openVPNPorts = [{ port = 21353; protocol = "both"; }];
  };

  systemd.services.qbittorrent.vpnConfinement = {
    enable = true;
    vpnNamespace = "AirVPN";
  };

  services.qbittorrent = {
    enable = true;
    webuiPort = 8080;
    torrentingPort = 21353;
    serverConfig = {
      "Preferences" = {
        "WebUI\\Address" = "192.168.15.1";
        "WebUI\\Port" = "8080";
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
