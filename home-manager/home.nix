{ config, pkgs, ... }:

{
  imports = [
    ./configs/default.nix
    ./programs/default.nix
  ];

/*
▄▄▄█████▓ ██░ ██ ▓█████     ██░ ██  ▒█████   ███▄ ▄███▓ ██▓▓█████ 
▓  ██▒ ▓▒▓██░ ██▒▓█   ▀    ▓██░ ██▒▒██▒  ██▒▓██▒▀█▀ ██▒▓██▒▓█   ▀ 
▒ ▓██░ ▒░▒██▀▀██░▒███      ▒██▀▀██░▒██░  ██▒▓██    ▓██░▒██▒▒███   
░ ▓██▓ ░ ░▓█ ░██ ▒▓█  ▄    ░▓█ ░██ ▒██   ██░▒██    ▒██ ░██░▒▓█  ▄ 
  ▒██▒ ░ ░▓█▒░██▓░▒████▒   ░▓█▒░██▓░ ████▓▒░▒██▒   ░██▒░██░░▒████▒
  ▒ ░░    ▒ ░░▒░▒░░ ▒░ ░    ▒ ░░▒░▒░ ▒░▒░▒░ ░ ▒░   ░  ░░▓  ░░ ▒░ ░
    ░     ▒ ░▒░ ░ ░ ░  ░    ▒ ░▒░ ░  ░ ▒ ▒░ ░  ░      ░ ▒ ░ ░ ░  ░
  ░       ░  ░░ ░   ░       ░  ░░ ░░ ░ ░ ▒  ░      ░    ▒ ░   ░   
          ░  ░  ░   ░  ░    ░  ░  ░    ░ ░         ░    ░     ░  ░
                                                                  
          ▄████▄   ▒█████   ███▄    █   █████▒██▓  ▄████          
         ▒██▀ ▀█  ▒██▒  ██▒ ██ ▀█   █ ▓██   ▒▓██▒ ██▒ ▀█▒         
         ▒▓█    ▄ ▒██░  ██▒▓██  ▀█ ██▒▒████ ░▒██▒▒██░▄▄▄░         
         ▒▓▓▄ ▄██▒▒██   ██░▓██▒  ▐▌██▒░▓█▒  ░░██░░▓█  ██▓         
         ▒ ▓███▀ ░░ ████▓▒░▒██░   ▓██░░▒█░   ░██░░▒▓███▀▒         
         ░ ░▒ ▒  ░░ ▒░▒░▒░ ░ ▒░   ▒ ▒  ▒ ░   ░▓   ░▒   ▒          
           ░  ▒     ░ ▒ ▒░ ░ ░░   ░ ▒░ ░      ▒ ░  ░   ░          
         ░        ░ ░ ░ ▒     ░   ░ ░  ░ ░    ▒ ░░ ░   ░          
         ░ ░          ░ ░           ░         ░        ░          
         ░                     
*/

  home.username = "erik";
  home.homeDirectory = "/home/erik";
  home.stateVersion = "24.11";

  home.packages = [
    pkgs.bluetuith              # For Bluetooth functionality. Click the icon on the top-right!
    pkgs.discord
    pkgs.docker-compose
    pkgs.fastfetch
    pkgs.font-awesome           # For icon functionality. Peep the waybar!
    pkgs.gimp
    pkgs.gnome-terminal
    pkgs.hyprpaper
    pkgs.hyprshot
    pkgs.libreoffice-qt6-fresh
    pkgs.lunarvim
    pkgs.ncdu                   # To checkout Disk Usage
    pkgs.nemo
    pkgs.networkmanager         # Gotta double check if I need this.
    pkgs.obs-studio
    pkgs.obsidian
    pkgs.openconnect            # Use instead of cisco anyconnect (sudo openconnect [server] --useragent=AnyConnect)
    pkgs.p7zip
    pkgs.prismlauncher
    pkgs.pulsemixer
    pkgs.r2modman
    pkgs.rofi-wayland
    pkgs.signal-desktop
    pkgs.spotify                # Just as a note, if spotify won't start -> rm -rf $HOME/.cache/spotify/
    pkgs.thunderbird
    pkgs.unzip                  # To unzip files in the command line (Use "unzip!")     
    pkgs.vlc
    pkgs.waybar
    pkgs.xwayland               # Ensures compatability with older applications that use X11 (Makes wayland able to display properly)
    pkgs.zip

  # Hacking Tools
    pkgs.nmap
    pkgs.stegseek
  ];

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
}
