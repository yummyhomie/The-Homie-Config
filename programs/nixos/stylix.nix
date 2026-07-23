{ pkgs, ... }:
{
  stylix = {
    enable = true;
    polarity = "dark";
    base16Scheme = {
      palette = {
        base00 = "0a0e14"; # main bg — near-black navy
        base01 = "0f1620"; # panel/status bg
        base02 = "16202c"; # selection bg
        base03 = "3a5068"; # comments / muted grid lines
        base04 = "6b8ba3"; # dim foreground
        base05 = "b8d4e3"; # default text — pale cyan-white
        base06 = "d9ecf5"; # light fg
        base07 = "eaf6fb"; # brightest — trajectory/highlight white
        base08 = "ff4d4d"; # red — crosshairs, alerts
        base09 = "ff8c3a"; # amber — CRT readout orange
        base0A = "ffcc33"; # gold/yellow accent text
        base0B = "39ff6a"; # phosphor green — radar sweep
        base0C = "29e6e6"; # cyan — grid lines, primary glow
        base0D = "3aa0ff"; # blue accent
        base0E = "cc66ff"; # magenta — vector/plot lines
        base0F = "995522"; # rust brown — muted/deprecated
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
