{ config, pkgs, ... }:

{
  imports = [
    ~/.config/The-Homie-Config/waybar/waybar.nix
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
    pkgs.networkmanagerapplet
    pkgs.nemo
    pkgs.obsidian
    pkgs.openconnect
    pkgs.pavucontrol
    pkgs.spotify # Just as a note, if spotify won't start -> rm -rf $HOME/.cache/spotify/
    pkgs.ungoogled-chromium
    pkgs.vim
    pkgs.vscode
    pkgs.waybar
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
      alias way='lvim ~/.config/The-Homie-Config/waybar/waybar.nix'
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
        search = {
          force = true;
          default = "DuckDuckGo";
        };
        settings = {};
      };
    };
  };

  # Git
  programs.git = {
    enable = true;
    userName = "yummyhomie";
    userEmail = "eleedee@outlook.com";
  };

  # Yazi # Work in Progress
  programs.yazi = {
    enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  home.file = {};

  home.sessionVariables = {};

  programs.home-manager.enable = true;
}
