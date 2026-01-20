{ pkgs, ... }:
{
  stylix = {
    enable = true;
    polarity = "dark";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/chinoiserie-midnight.yaml";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/mocha.yaml";
    
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
