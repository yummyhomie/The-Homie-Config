{ config, pkgs, ... }:

{
  imports = [
    ../home-manager/bashrc.nix
    ../home-manager/firefox.nix
    ../home-manager/waybar.nix
  ];

  home.username = "erik";
  home.homeDirectory = "/home/erik";
  home.stateVersion = "24.11";

  home.packages = [
    pkgs.bluetuith              # For Bluetooth functionality. Click the icon on the top-right!
    pkgs.discord
    pkgs.fastfetch
    pkgs.font-awesome           # For icon functionality. Peep the waybar!
    pkgs.git      
    pkgs.gnome-terminal
    pkgs.hyprpaper
    pkgs.hyprshot
    pkgs.libreoffice-qt6-fresh  
    pkgs.lunarvim
    pkgs.nemo
    pkgs.nautilus
    pkgs.networkmanager         # Gotta double check if I need this. 
    pkgs.obsidian
    pkgs.openconnect            # Use instead of cisco anyconnect
    pkgs.pulsemixer
    pkgs.spotify                # Just as a note, if spotify won't start -> rm -rf $HOME/.cache/spotify/
    pkgs.ungoogled-chromium 
    pkgs.unzip                  # To unzip files in the command line (Use "unzip!")
    pkgs.vim           
    pkgs.vscode
    pkgs.waybar
    pkgs.xwayland
    pkgs.wofi
    pkgs.xorg.xrandr
  ];

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
