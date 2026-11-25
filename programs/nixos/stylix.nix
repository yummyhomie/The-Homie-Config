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

    # Holy this took forever to find. To see what name to use when adding a font, run:
    # fc-scan --format '%{family}\n' $(nix build nixpkgs#FONT/ICON_PACKAGE_NAME --no-link --print-out-paths)/share/fonts/*/* | sort -u
    fonts = {
      monospace = {
        package = pkgs.ioskeley-mono.standard;
        name    = "Ioskeley Mono Medium";
      };
      sizes = {
        terminal = 12;
        applications = 12;
      };
    };

    icons = {
      enable = true;
      dark = "menta";
      package = pkgs.mate-icon-theme;
    };

    opacity = {
      desktop = 1.00;
      terminal = 0.50;
      popups = 1.00;
    };
  };
}
