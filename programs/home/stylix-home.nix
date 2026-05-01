{ pkgs, ... }:
{
  stylix = {
    targets = {
      btop.enable = true;
      foot.enable = true;
      librewolf = {
        enable = true;
        colorTheme.enable = true;
        firefoxGnomeTheme.enable = true;
        profileNames = [ "Default" "I2P" ];
      };
      nixcord.enable = true;
      vscode = {
        enable = true; 
        profileNames = [ "Default" ];
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
