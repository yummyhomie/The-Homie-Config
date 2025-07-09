{ config, lib, pkgs, ... }:

let
  machineName = "the-homie-laptop"; # Set this manually on each machine
  machineConfig = 
    if machineName == "the-homie-laptop" then ./laptop.nix
    else if machineName == "the-homie-machine" then ./desktop.nix
    else abort "Unknown Hostname. Try again!";
in

{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
      machineConfig
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # CPU & GPU 
  boot.kernelParams = [ "iommu=soft" ];
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
     extraGroups = [ "wheel" ];
     packages = with pkgs; [ btop ];
  };

  # Packages On This System
  environment.systemPackages = with pkgs; [];

  # Programs & Services On This System
  
  # Hyprland
  programs.hyprland.enable = true;

  # Hypridle
  services.hypridle.enable = true;

  # River
  programs.river = {
    enable = true;
    xwayland.enable = true;
  };

  #Steam
  programs.steam.enable = true;
  
  # Virtual File System (For connecting to network folders)
  services.gvfs.enable = true;

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  };
  nix.gc = {
    automatic = true;
    dates = "weekly";
  };

  virtualisation.virtualbox = {
    host = {
      enable = true;
      enableKvm = true;
      enableExtensionPack = true;
      addNetworkInterface = false;
    };
  };
 
  virtualisation.vmware.host.enable = true;

  virtualisation.docker.enable = true;

  # ZeroTier
  services.zerotierone = {
    enable = true;
    joinNetworks = [ "60ee7c034a366ab7" ];
  };
  
  nixpkgs.config.allowUnfree = true;

  networking.firewall.enable = true;
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  
  system.stateVersion = "24.11"; # Did you read the comment?

}

