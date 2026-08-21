{ pkgs, ... }:
{
  stylix = {
    targets = {
      btop.enable = true;
      firefox = {
        enable = true;
        colorTheme.enable = true;
        firefoxGnomeTheme.enable = true;
        profileNames = [ "default" "I2P" ];
      };
      nixcord.enable = true;
      vscodium = {
        enable = true; 
        profileNames = [ "default" ];
      };
      waybar.enable = false;    
    };
  };

  # This is here since the nixos stylix config doesn't have options for home-manager 
  home.pointerCursor = {
    name = "Hackneyed";
    package = pkgs.hackneyed;
    size = 16;
    gtk.enable = true;
  };
}
