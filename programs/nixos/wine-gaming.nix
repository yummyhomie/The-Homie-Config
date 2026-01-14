{ config, pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  environment.systemPackages = with pkgs; [
    wineWowPackages.stable
    wineWowPackages.staging
    winetricks
    
    vulkan-tools
    vulkan-loader

    gnome-disk-utility
    heroic
  ];
}
