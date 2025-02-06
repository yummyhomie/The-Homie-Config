{ config, pkgs, ... }:

{
  imports = [
    ./waybar/waybar.nix
    ./bashrc/bashrc.nix
  ];

  home.username = "erik";
  home.homeDirectory = "/home/erik";
  home.stateVersion = "24.11";

  home.packages = [
    pkgs.discord
    pkgs.firefox
    pkgs.git
    pkgs.gnome-terminal
    pkgs.gnome-tweaks
    pkgs.libreoffice-qt6-fresh
    pkgs.lunarvim
    pkgs.networkmanager
    pkgs.obsidian
    pkgs.openconnect
    pkgs.spotify
    pkgs.vim
    pkgs.vscode
    pkgs.wofi
    pkgs.xorg.xrandr

    # Packages for Hyprland
    pkgs.hyprpaper
    pkgs.hyprshot
    pkgs.wofi
  ];

  programs.git = {
    enable = true;
    userName = "yummyhomie";
    userEmail = "eleedee@outlook.com";
  };

  nixpkgs.config.allowUnfree = true;

  home.file = {};

  home.sessionVariables = {};

  programs.home-manager.enable = true;
}
