{config, pkgs, ...}:
{
  programs.waybar.enable = true;

  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      position = "top";
      height = 25;
      modules-left = [
        "hyprland/workspaces"
      ];
      modules-center = [
        "clock"
      ];
      modules-right = [
        "pulseaudio"
        "memory"
        "cpu"
        "battery"
        "disk"
      ];
    };
  };
}
