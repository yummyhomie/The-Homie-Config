{config, pkgs, inputs, ... }:

{
  imports = [
    ../../programs/nixos/airvpn.nix
    ../../programs/nixos/filebrowser.nix
    ../../programs/nixos/flaresolver.nix
    ../../programs/nixos/i2p.nix
    ../../programs/nixos/immich.nix
    ../../programs/nixos/jellyfin.nix
    ../../programs/nixos/nixarr.nix
    ../../programs/nixos/radicale.nix
    ../../programs/nixos/samba.nix
    ../../programs/nixos/syncthing.nix
    ../../programs/nixos/qbittorrent.nix
  ];

  networking.hostName = "the-homie-server";

  # Users
  users.users.erik.extraGroups = [ 
    "i2p"               # I2P
    "i2pd"              # I2PD
    "immich"            # Immich
    "jellyfin"          # Jellyfin
    "media"             # Media Group
    "networkmanager"    # Networking
    "render"            # Gives Permission to access GPU 4 Hardware Acceleration for Jellyfin
    "samba"             # Samba
    "wheel"             # Not sure LMAO
  ];

  # Firewall
  networking.firewall.allowedTCPPorts = [ 
    7657      # i2p & i2pd
  ];

  fileSystems."/Warehouse" = {
    device = "/dev/disk/by-uuid/74786c01-9ab9-4d4f-bb46-7026a0586d8c";
    fsType = "ext4";
    options = [ "defaults" "users" "exec" ];
  };

  systemd.tmpfiles.rules = [
    # Warehouse Permissions
    "d /Warehouse                            0755 root         root -"
    "d /Warehouse/Media                      0755 root         root -"
    
    # Arr Stack
    "d /Warehouse/Media/Movies               2775 radarr      media -"
    "d /Warehouse/Media/Shows                2775 sonarr      media -"
    
    # QBittorrent
    "d /Warehouse/Media/Downloads            2775 qbittorrent media -"
    "d /Warehouse/Media/Downloads/Incomplete 2775 qbittorrent media -"
    "d /Warehouse/Media/Downloads/radarr     2775 qbittorrent media -"
    "d /Warehouse/Media/Downloads/sonarr     2775 qbittorrent media -"

    # Jellyfin
    "d /Warehouse/Media/Jellyfin             2775 jellyfin    media -"
    "d /Warehouse/Media/Jellyfin/data        2775 jellyfin    media -"
    "d /Warehouse/Media/Jellyfin/cache       2775 jellyfin    media -"
    "d /Warehouse/Media/Jellyfin/config      2775 jellyfin    media -"
    "d /Warehouse/Media/Jellyfin/log         2775 jellyfin    media -"
  ];

  # If you have issues writing to the drives
  # sudo chown -R erik:users /path
  # chmod -R 755 /path

  # Version
  system.stateVersion = "24.05";
}

  # Notes
  # NixOS makes it easier to fully remove services and programs, but sometimes, you will need to do some manual digging. 
  # This is the best way I've found to be able to fully remove a service from this nixOS System. 
  # 
  #1. Remove from NixOS Configuration File (duh lmao)
  #2. Rebuild System (sudo nixos-rebuild switch)
  #3. Clean up old Generations (optional) [sudo nix-collect-garbage -d]
  #4. Manually remove persistent data (/var/lib, /etc, /run)
    # sudo find /var /etc /run -name "*NAME-HERE*"
    # Then rm -rf that mofo
  #5. Optional, run these to improve system. Maybe. 
    # sudo nix-store --gc
    # sudo nix-store --optimize
