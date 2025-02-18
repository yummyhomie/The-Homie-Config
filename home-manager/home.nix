{ config, pkgs, ... }:

{
  imports = [
  ];

  home.username = "erik";
  home.homeDirectory = "/home/erik";
  home.stateVersion = "24.11";

  home.packages = [
    pkgs.bluez                  # bluetoothctl, devices, connect [mac address]
    pkgs.discord
    pkgs.fastfetch
    pkgs.font-awesome
    pkgs.git
    pkgs.gnome.gvfs                   # Support for remote file system management
    pkgs.gnome-terminal
    pkgs.hyprpaper
    pkgs.libreoffice-qt6-fresh
    pkgs.librewolf
    pkgs.lunarvim
    pkgs.networkmanager
    pkgs.nautilus
    pkgs.nemo
    pkgs.nnn
    pkgs.obsidian
    pkgs.openconnect
    pkgs.pavucontrol
    pkgs.spotify # Just as a note, if spotify won't start -> rm -rf $HOME/.cache/spotify/
    pkgs.xfce.thunar
    pkgs.vim
    pkgs.vscode
    pkgs.xwayland
    pkgs.wofi
    pkgs.xorg.xrandr
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

  # Hyprpaper *Currently needs more troubleshooting, this breaks the wallpaper :( *
  #services.hyprpaper = {
  #  enable = true;
  #  settings = {
  #    preload = [" /home/erik/.config/hypr/fall.jpg "];
  #    wallpaper = [ " , /home/erik/.config/hypr/fall.jpg "];
  #  };
  #};

  # Hypridle  *Currently in progress. Service, so it won't work on home-manager. Find alt way to run hypridle/lock*
  #services.hypridle = {
  #  enable = true;
  #  general = {
  #    lock_cmd = "pidof hyprlock || hyprlock";       # avoid starting multiple hyprlock instances.
  #    before_sleep_cmd = "loginctl lock-session";    # lock before suspend.
  #    after_sleep_cmd = "hyprctl dispatch dpms on";  # to avoid having to press a key twice to turn on the display.
  #  }; 
  #
  #  listener = [
  #    {
  #      timeout = 150;                                # 2.5min.
  #      on-timeout = "brightnessctl -s set 10";       # set monitor backlight to minimum, avoid 0 on OLED monitor.
  #      on-resume = "brightnessctl -r";               # monitor backlight restore.
  #    }
  #    {
  #      timeout = 300;                                 # 5min
  #      on-timeout = "loginctl lock-session";          # lock screen when timeout has passed
  #    }
  #    {
  #      timeout = 330;                                 # 5.5min
  #      on-timeout = "hyprctl dispatch dpms off";      # screen off when timeout has passed
  #      on-resume = "hyprctl dispatch dpms on";        # screen on when activity is detected after timeout has fired.
  #    }
  #    {
  #      timeout = 1800;                                # 30min
  #      on-timeout = "systemctl suspend";              # suspend pc
  #    }
  #  ];
  #};

  # Hyprlock
  #programs.hyprlock = {
  #  enable = true;
  #};

  # lf 
  programs.lf = {
    enable = true;
    commands = {
      dragon-out = ''%${pkgs.xdragon}/bin/xdragon -a -x "$fx"'';
    };
    keybindings = {};
    settings = {
      preview = true;
      hidden = true;
      drawbox = true;
      icons = true;
      ignorecase = true;
    };
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
        
        modules-left = [ "hyprland/workspaces" ];  
        modules-center = [];
        modules-right = [
          "clock"
          # "pulseaudio#microphone"
          "network"
          "pulseaudio"
          "battery"
        ];

        "hyprland/workspaces" = {
          "all-outputs" = false;
        };

        clock = {
          interval = 60;
          format = "{:%A, %b %d - %I:%M %p}";
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "";
          format-icons = {
            default = ["" "" ""];
            headphone = "";
          };
          tooltip-format = "{desc}\nVolume: {volume}%";
          on-click = "pavucontrol";
        };

        #"pulseaudio#microphone" = { # Gotta try to get mic mute/unmute functionality working
        #  format = "";
        #  format-source-muted = "";
        #  tooltip-format = "Microphone (Source)\n{source_desc}";
        #  on-click = "pavucontrol";
        #};
        

        network = {
          format-wifi = "";
          format-ethernet = "";
          format-disconnected = "";
          tooltip-format = "Connected to {essid}\nIP: {ipaddr}\nStrength: {signalStrength}%";
          tooltip-format-ethernet = "IP: {ipaddr}\nInterface: {ifname}";
          tooltip-format-disconnected = "Disconnected";
          interval = 30;
        };

        battery = {
          format.low = "{capacity}% ";
          format-charging = "{capacity}%";
          format-icons = [ "" "" "" "" "" ];
          interval = 30;
            states = {
              warning = 30;
              crticial = 15;
            };
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
        font-family: Trebuchet;
      }

      window#waybar {
        background: #292828;
        color: #ffffff;
      }

      #workspaces button {
        margin-right: 10px;
        color: #ffffff;
      }

      #pulseaudio {
        margin-left: 16px;
      }

      #pulseaudio#microphone {
        margin-left: 16px;
      }

      #network {
        margin-left: 16px;
      }
    '';        
  };

  # Yazi
  programs.yazi = {
    enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  home.file = {};

  home.sessionVariables = {};

  programs.home-manager.enable = true;
}
