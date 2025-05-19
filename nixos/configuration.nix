{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "the-homie-machine";
  networking.networkmanager.enable = true;
  time.timeZone = "America/Denver";

  # Hardware
  hardware.bluetooth.enable = true;

  users.users.erik = {
     isNormalUser = true;
     extraGroups = [ "wheel" "wireshark" ];
     packages = with pkgs; [
       tree
     ];
  };

  # Packages On This System
  environment.systemPackages = with pkgs; [
    pkgs.os-prober
    pkgs.ntfs3g # For NTFS Recognition
    pkgs.wireshark
  ];

  # Programs & Services On This System
  
  # Hyprland
  programs.hyprland.enable = true;

  # Hypridle
  services.hypridle.enable = true;

  #Steam
  programs.steam.enable = true;
  
  # Virtual File System (For connecting to network folders)
  services.gvfs.enable = true;

  nix = {
    settings = {
      auto-optimise-store = true;
    };
  };
  nix.gc = {
    automatic = true;
    dates = "weekly";
  };
 
  virtualisation.virtualbox = {
    host = {
      enable = true;
      enableExtensionPack = true;
    };
  };

  # Apache Server (For Class)
  services.httpd = {
    enable = false;
    enablePHP = false;
    user = "user to run as";
    virtualHosts.localhost = {
      documentRoot = "Directory Folder where HW is";
      extraConfig = ''
        <Directory "Directory Folder where HW is">
          Require all granted
          Options Indexes FollowSymlinks
          AllowOverride All
        </Directory>
      '';
    };
  };
  
  nixpkgs.config.allowUnfree = true;

  networking.firewall.enable = true;
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  
  system.stateVersion = "24.11"; # Did you read the comment?

}

