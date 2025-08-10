{ config, lib, pkgs, ... }:

let
  machineName = "the-homie-machine"; # Set this manually on each machine
  machineConfig = 
    if machineName == "the-homie-laptop" then ./laptop.nix
    else if machineName == "the-homie-machine" then ./desktop.nix
    else abort "Unknown Hostname. Try again!";
in

{
  imports =
    [
      ./hardware-configuration.nix
      ./stylix.nix
      machineConfig
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # CPU & GPU 
  hardware.cpu.amd.updateMicrocode = 
    lib.mkDefault config.hardware.enableRedistributableFirmware;

  hardware.amdgpu.initrd.enable = lib.mkDefault true;

  # Networking
  networking.networkmanager.enable = true;
  networking.networkmanager.dns = "default";
  networking.networkmanager.ethernet.macAddress = "permanent";
  time.timeZone = "America/Denver";

  # Hardware
  hardware.bluetooth.enable = true;

  users.users.erik = {
     isNormalUser = true;
     extraGroups = [ "wheel" ];
     packages = with pkgs; [ btop ];
  };

  # Flakes
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    warn-dirty = false;
  };

  # Packages On This System
  environment.systemPackages = with pkgs; [];

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
 
  nixpkgs.config.allowUnfree = true;

  networking.firewall.enable = true;
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  
  system.stateVersion = "24.11"; # Did you read the comment?

}

