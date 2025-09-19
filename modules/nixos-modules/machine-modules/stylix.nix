{ pkgs, ... }:
{
  stylix = {
    enable = true;
    polarity = "dark";
    image = ../../hypr/menbug.jpg;
    base16Scheme = {
      system = "base16";
      name = "Terracotta Dark";
      author = "Jay Cornwall (https://jcornwall.com)";
      variant = "dark";
      palette = {
        base00 = "#241d1a";
        base01 = "#362b27";
        base02 = "#473933";
        base03 = "#594740";
        base04 = "#a78e84";
        base05 = "#b8a59d";
        base06 = "#cabbb5";
        base07 = "#dcd2ce";
        base08 = "#f6998f";
        base09 = "#ffa888";
        base0A = "#ffc37a";
        base0B = "#b6c68a";
        base0C = "#c0bcdb";
        base0D = "#b0a4c3";
        base0E = "#d8a2b0";
        base0F = "#f1ae97"; 
      };
    };

    #  system = "base16";
    #  name = "Charcoal Dark";
    #  author = "Mubin Muhammad (https://github.com/mubin6th)";
    #  variant = "dark";
    #  palette = {
    #    base00 = "#120f09";
    #    base01 = "#1e1812";
    #    base02 = "#35291d";
    #    base03 = "#66553f";
    #    base04 = "#a28662";
    #    base05 = "#c0a179";
    #    base06 = "#d6b891";
    #    base07 = "#292016";
    #    base08 = "#887254";
    #    base09 = "#d6b891";
    #    base0A = "#c0a179";
    #    base0B = "#927a60";
    #    base0C = "#a28662";
    #    base0D = "#d6b891";
    #    base0E = "#a28662";
    #    base0F = "#887254";
    #  };
    #};

    cursor = {
      name = "Hackneyed";
      package = pkgs.hackneyed;
      size = 16;
    };

    opacity = {
      terminal = 0.90;
    };
  };
}
