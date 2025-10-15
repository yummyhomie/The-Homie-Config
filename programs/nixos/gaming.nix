{ pkgs, lib, ... }:
{
  # Steam
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
  
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  
  services.xserver.videoDrivers = ["amdgpu"];
  programs.gamemode.enable = true;

  programs.gpu-screen-recorder.enable = true;
  
  environment.systemPackages = with pkgs; [
    # Common gaming dependencies
    vulkan-tools
    vulkan-loader
    vulkan-validation-layers
    mesa
    gpu-screen-recorder-gtk
  ];
  
  programs.xwayland.enable = true;
}
