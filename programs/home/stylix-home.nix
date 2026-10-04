{ pkgs, ... }:
{
  stylix = {
    targets = {
      btop.enable = true;
      
      librewolf = {
        enable = true;
        colorTheme.enable = true;
        firefoxGnomeTheme.enable = true;
        profileNames = [ "default" "I2P" ];
      };
      
      vesktop = {
        enable = true;
        colors.enable = true;
        fonts.enable = true;
      };
      
      vscodium = {
        enable = true; 
        colors.enable = true;
        fonts.enable = true;
        profileNames = [ "default" ];
      };
      
      waybar.enable = false;    
    };
  };

  # This is here since the nixos stylix config doesn't have options for home-manager 
  home.pointerCursor = {
    enable = true;
    name = "Hackneyed";
    package = pkgs.hackneyed;
    size = 16;
  };
}
