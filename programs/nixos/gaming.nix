{ pkgs, lib, ... }:
{
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
  };

  hardware.cpu.amd.updateMicrocode = true;
  
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [ rocmPackages.clr.icd ];  # OpenCL support
  };
  
  environment.systemPackages = with pkgs; [
    mesa
    vulkan-tools
    vulkan-loader
    vulkan-validation-layers
    nvtopPackages.amd    # GPU usage monitor for AMD
  ];
  
  programs.xwayland.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];
  programs.gamemode.enable = true;
}
