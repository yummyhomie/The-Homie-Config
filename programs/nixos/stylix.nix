{ pkgs, ... }:
{
  stylix = {
    enable = true;
    polarity = "dark";
    image = ../window-manager/wallpapers/sunset.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/irblack.yaml";
    
    cursor = {
      name = "Hackneyed";
      package = pkgs.hackneyed;
      size = 16;
    };

    opacity = {
      desktop = 0.80;
      terminal = 0.80;
      popups = 0.80;
    };
  };
}
