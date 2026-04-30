{config, pkgs, inputs, ... }:

{
  imports = [
    # ../../programs/nixos/adguard.nix # Testing PiHole
    ../../programs/nixos/filebrowser.nix
    ../../programs/nixos/i2p.nix
    ../../programs/nixos/jellyfin.nix
    ../../programs/nixos/radicale.nix
    ../../programs/nixos/samba.nix
    ../../programs/nixos/syncthing.nix
  ];

  networking.hostName = "the-homie-server";

  # Users
  users.users.erik.extraGroups = [ 
    "i2p"               # I2P
    "i2pd"              # I2PD
    "jellyfin"          # Jellyfin
    "networkmanager"    # Networking
    "render"            # Gives Permission to access GPU 4 Hardware Acceleration for Jellyfin
    "samba"             # Samba
    "wheel"             # Not sure LMAO
  ];

  # Firewall
  networking.firewall.allowedTCPPorts = [ 
    7657      # i2p & i2pd
  ];

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
