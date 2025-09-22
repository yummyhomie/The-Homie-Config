{ config, lib, pkgs, ... }:

{
  imports = [ ./nixos-modules/machine-modules/default.nix ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # CPU & GPU 
  hardware.cpu.amd.updateMicrocode = 
    lib.mkDefault config.hardware.enableRedistributableFirmware;

  hardware.amdgpu.initrd.enable = lib.mkDefault true;

  # Networking
  networking.networkmanager.enable = true;
  time.timeZone = "America/Denver";

  # Hardware
  hardware.bluetooth.enable = true;

  users.users.erik = {
     isNormalUser = true;
     extraGroups = [ "wheel" "docker" ];
     packages = with pkgs; [ btop ];
  };

  # Flakes
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    warn-dirty = false;
  };

  # Packages On This System
  environment.systemPackages = with pkgs; [ docker-compose xwayland-satellite ];

  # Programs & Services On This System

  # Docker
  virtualisation.docker.enable = true;
 
  # Hyprland
  programs.hyprland.enable = true;

  # Hypridle
  services.hypridle.enable = true;
  
  # Niri
  programs.niri.enable = true; # Off until I get a good enough config working

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
  };

  # QEMU
  services.qemuGuest.enable = true;

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
 
  nixpkgs.config.allowUnfree = true;

  networking.firewall.enable = true;
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  
  system.stateVersion = "24.11"; # Did you read the comment?

}

