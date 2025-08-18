{ config, pkgs, ... }:

{
  imports = [ 
    ./shared/homeModules/default.nix 
    ./shared/nixModules/stylix.nix
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
    firefox
    font-awesome           # For icon functionality. Peep the waybar!
    gimp
    gvfs                   # This helps with connecting to remote folders via nautilus
    hyprpaper
    hyprshot
    libreoffice-qt6-fresh
    lm_sensors
    nautilus
    ncdu                   # To checkout Disk Usage
    networkmanager         # Gotta double check if I need this.
    nmap
    obs-studio
    obsidian
    openconnect            # Use instead of cisco anyconnect (sudo openconnect [server] --useragent=AnyConnect)
    p7zip
    prismlauncher
    pulsemixer
    r2modman
    signal-desktop
    spotify                # Just as a note, if spotify won't start -> rm -rf $HOME/.cache/spotify/
    tree
    thunderbird
    unzip                  # To unzip files in the command line (Use "unzip!")     
    vlc
    waybar
    xwayland               # Ensures compatability with older applications that use X11 (Makes wayland able to display properly)
    zip
  ];

  stylix.targets.waybar.enable = false; # This option doesn't exists for NixOS. Thus why it's here. Just a band-aid tho for now. 

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
}
