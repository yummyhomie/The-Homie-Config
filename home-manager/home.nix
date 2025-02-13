{ config, pkgs, ... }:

{
  imports = [
  ];

  home.username = "erik";
  home.homeDirectory = "/home/erik";
  home.stateVersion = "24.11";

  home.packages = [
    pkgs.bluez # bluetoothctl, devices, connect [mac address]
    pkgs.discord
    pkgs.git
    pkgs.gnome-terminal
    pkgs.libreoffice-qt6-fresh
    pkgs.librewolf
    pkgs.lunarvim
    pkgs.nautilus
    pkgs.networkmanager
    pkgs.obsidian
    pkgs.openconnect
    pkgs.spotify # Just as a note, if spotify won't start -> rm -rf $HOME/.cache/spotify/
    pkgs.vim
    pkgs.vscode
    pkgs.xwayland
    pkgs.wofi
    pkgs.xorg.xrandr

    # Packages for Hyprland
    pkgs.hyprpaper
    pkgs.wofi
    #pkgs.xdg-desktop-portal
    #pkgs.xdg-desktop-portal-gtk
    #pkgs.dbus
  ];

  fonts.packages = with pkgs; [
    font-awesome
    font-awesome_5
  ];

  # bashrc
  programs.bash = {
    enable = true;
    initExtra = ''
      #Color variables cuz I like to switch colors alot
      red="\033[01;31m\]"
      yellow="\033[01;33m\]"
      green="\033[01;32m\]"
      blue="\033[01;34m\]"
      purple="\033[01;35m\]"
      cyan="\033[01;36m\]"
      white="\033[01;37m\]"
      black="\033[01;30m\]"
      end="\\033[00m\]"

      # black=30 blue=34 cyan=36 green=32 purple=35 red=31 white=37 yellow=33

      # Other variables cuz trying new things is fun
      bold="\e[1m"
      italics="\e[3m"
      under="\e[4m"
      strike="\e[9m"
      varEnd="\e[0m"

      # bold=1 italic=3 underline=4 strikethrough=9


      PS1="$green\u@\h$end $blue\w$end $yellow\@$end: "

      alias ls='ls --color=auto'
      alias grep='grep --color=auto'

      alias edit='lvim ~/.config/home-manager/home.nix'
      alias switch='home-manager switch && source ~/.bashrc'
      alias hypr='lvim ~/.config/hypr/hyprland.conf'
      alias p='hyprshot -m region --clipboard-only'
      alias way='lvim ~/.config/home-manager/waybar/waybar.nix'
      alias nixos='sudo lvim /etc/nixos/configuration.nix'
      alias rebuild='sudo nixos-rebuild switch'
    '';
  };

  # Firefox
  programs.firefox = {
    enable = true;
    policies = {
      DefaultDownloadDirectory = "/home/erik/Downloads/";
    };
    profiles = {
      default = {
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          privacy-badger
          bitwarden
          vimium
          i-dont-care-about-cookies
          sidebery
        ];
        search = {
          force = true;
          default = "DuckDuckGo";
        };
        settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "uc.tweak.rounded-corners" = true;
          "browser.newtabpage.pinned" = [
          {
            title = "cyscuvu";
            url = "https://cyscuvu.com";
          }
          {
            title = "nix";
            url = "https://search.nixos.org/packages";
          }
          {
            title = "github";
            url = "https://github.com/yummyhomie";
          }
          {
            title = "canvas";
            url = "https://uvu.instructure.com/";
          }
          {
           title = "tryhackme";
           url = "https://tryhackme.com/dashboard";
          }
          {
            title = "outlook";
            url = "https://outlook.office.com/mail/";
          }
          ];
        };
        userChrome = (builtins.readFile ./userChrome.css);
        userContent = (builtins.readFile ./userContent.css);
      };
    };
  };

  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };
  # This is to allow firefox to install extensions with home-manager!

  # Git
  programs.git = {
    enable = true;
    userName = "yummyhomie";
    userEmail = "eleedee@outlook.com";
  };

  # Waybar 
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin = "4px, 4px, 0px, 4px";
        height = 25;
        modules-left = [
          "hyprland/workspaces"
          "hyprland/mode"
        ];
        modules-center = [
          "clock"
        ];
        "clock" = {
          interval = 60;
          format = "{:%A, %b %d - %I:%M %p}";
        };
        modules-right = [
          "pulseaudio"
          "memory"
          "cpu"
          "battery"
          "disk"
        ];
        "battery" = {
          format = "";
        };
      };
    };
    style = ''
      * {
        border: none;
        border-radius: 0;
        padding: 0;
        margin: 0;
        font-size: 16px;
        font-family: "Font Awesome 6 Free",san-serif;
      }

      window#waybar{
        background: #292828;
        color: #ffffff;
      }

      #workspaces button {
        margin-right: 10px;
        color: #ffffff;
      }

      #workspaces button:hover, #workspaces button:active {
        background-color: #292828;
        color: #ffffff;
      }
      
      #workspaces button.focused {
        background-color: #383737;
      }


      #battery {
        margin-left: 7px;
        margin-right: 3px;
      }
    '';        
  };

  nixpkgs.config.allowUnfree = true;

  home.file = {};

  home.sessionVariables = {};

  programs.home-manager.enable = true;
}
