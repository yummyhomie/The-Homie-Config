{
  # Steam
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true; # vimjoyer suggestion
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = ["amdgpu"];

  programs.gamemode.enable = true;
}
