{ pkgs, lib, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_cachyos;

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
    protontricks.enable = true;
  };

  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };

  programs.gamemode.enable = true;

  hardware.cpu.amd.updateMicrocode = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  environment.systemPackages = with pkgs; [
    mangohud
    nvtopPackages.amd
    corectrl
    gamescope
  ];

  security.polkit.enable = true;

  programs.xwayland.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

  services.scx = {
    enable = true;
    scheduler = "scx_lavd";
  };
}
