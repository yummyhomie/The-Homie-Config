{ pkgs, ... }:
{
  stylix = {
    enable = true;
    polarity = "dark";
    image = ../window-manager/hypr/menbug.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-soft.yaml";
    
    cursor = {
      name = "Hackneyed";
      package = pkgs.hackneyed;
      size = 16;
    };

    opacity = {
      desktop = 0.90;
      terminal = 0.90;
      popups = 0.90;
    };
  };
}
