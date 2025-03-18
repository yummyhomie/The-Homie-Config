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
     extraGroups = [ "wheel" ];
     packages = with pkgs; [
       tree
     ];
  };

  # Packages On This System
  environment.systemPackages = with pkgs; [];

  # Programs On This System
  programs.hyprland.enable = true;
  
  programs.steam.enable = true;

  services.gvfs.enable = true;

  nix = {
    settings = {
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
 
  virtualisation.virtualbox = {
    host = {
      enable = true;
      enableExtensionPack = true;
    };
  };

  services.httpd = {
    enable = false;
    enablePHP = false;
    user = "erik";
    virtualHosts.localhost = {
      documentRoot = "$HOME/Documents/The-Destruction-of-Homework";
      extraConfig = ''
        <Directory "$HOME/Documents/The-Destruction-of-Homework">
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

