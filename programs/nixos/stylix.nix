{ pkgs, ... }:
{
  stylix = {
    enable = true;
    polarity = "dark";
    base16Scheme = {
      palette = {
        base00 = "1a1210";
        base01 = "241a15";
        base02 = "3d2b22";
        base03 = "6b5346";
        base04 = "9c8474";
        base05 = "e8d6c3";
        base06 = "f0e2d0";
        base07 = "f7ece0";
        base08 = "c1443c";
        base09 = "d97b3f";
        base0A = "d9a441";
        base0B = "8a9a4a";
        base0C = "6f9e93";
        base0D = "7088ab";
        base0E = "a2617a";
        base0F = "8b5a3c";
      };
    };

    icons = {
      enable = true;
      package = pkgs.chicago95;
      dark = "Chicago95";
    };

    opacity = {
      desktop = 1.00;
      terminal = 1.00;
      popups = 1.00;
    };

    fonts = {
      monospace = {
        package = pkgs.ioskeley-mono.normal-term-NF;
        name = "IoskeleyMonoTerm Nerd Font Medium";
      };
      sizes = {
        terminal = 12;
        applications = 12;
      };
    };

    #cursor = {
    #  name = "Hackneyed";
    #  package = pkgs.hackneyed;
    #  size = 16;
    #};
    
    # Stylix has an issue where it rebuilds the entire cursor package from source
    # every single time your rebuild/switch. I am letting home-manager 
    # handle this until a fix get's implemented.My rebuild times are way too long.
  };
}

# From old GTK config notes:
# To find the name of the theme/icon, run this command:
# cd $(nix build nixpkgs#PACKAGE-NAME --print-out-paths --no-link)
# It'll put you in it's directory and you can ls for the correct name.
# In case it has multiple options! YOU GOT THIS.
