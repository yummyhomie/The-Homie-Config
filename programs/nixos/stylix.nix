{ pkgs, ... }:
{
  stylix = {
    enable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/mocha.yaml";

    icons = {
      enable = true;
      package = pkgs.papirus-icon-theme.override { color = "black"; };
      dark = "Papirus-Dark";
    };
    
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

# From old GTK config notes:
# To find the name of the theme/icon, run this command:
# cd $(nix build nixpkgs#PACKAGE-NAME --print-out-paths --no-link)
# It'll put you in it's directory and you can ls for the correct name.
# In case it has multiple options! YOU GOT THIS.
