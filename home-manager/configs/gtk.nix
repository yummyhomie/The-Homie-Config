{ pkgs, ... }:

{
  gtk = {
    enable = true;
    theme = {
      name = "Colloid-Orange-Dark-Gruvbox";
      package = pkgs.colloid-gtk-theme.override {
        themeVariants = [ "orange" ];
        colorVariants = [ "dark" ];
        tweaks = [
          "gruvbox"
          "rimless"
          "float"
        ];
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme.override {color = "black"; };
    };
  };
}

# To find the name of the theme/icon, run this command:
# cd $(nix build nixpkgs#PACKAGE-NAME --print-out-paths --no-link)
# It'll put you in it's directory and you can ls for the correct name. 
# In case it has multiple options! YOU GOT THIS.
