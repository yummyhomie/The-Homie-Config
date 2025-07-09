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

  home.packages = with pkgs; [
    bluetuith              # For Bluetooth functionality. Click the icon on the top-right!
    brightnessctl
    discord
    docker-compose
    fastfetch
    font-awesome           # For icon functionality. Peep the waybar!
    gimp
    gnome-keyring
    gvfs                   # This helps with connecting to remote folders via nautilus
    hyprpaper
    hyprshot
    libreoffice-qt6-fresh
    lm_sensors
    nautilus
    ncdu                   # To checkout Disk Usage
    networkmanager         # Gotta double check if I need this.
    obs-studio
    obsidian
    openconnect            # Use instead of cisco anyconnect (sudo openconnect [server] --useragent=AnyConnect)
    p7zip
    prismlauncher
    pulsemixer
    r2modman
    signal-desktop
    spotify                # Just as a note, if spotify won't start -> rm -rf $HOME/.cache/spotify/
    thunderbird
    unzip                  # To unzip files in the command line (Use "unzip!")     
    vlc
    waybar
    xwayland               # Ensures compatability with older applications that use X11 (Makes wayland able to display properly)
    zip

  # Hacking Tools
    nmap
  ];

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
}
