{ config, pkgs, ... }:
  # Import home-manager modules & configs for all machines here!
{
  imports = [ 
    ../foot.nix
    ../gtk.nix
    ../hyprpaper.nix
    ../nixcord.nix
    ../rofi.nix
    ../spicetify.nix
    ../stylix-home.nix
    ../waybar.nix
    ../../nixos/stylix.nix # Connects home-managed programs to be styled by stylix
  ];

/*  ////////////////////////////////////////////////////////////////////////
    //                                                                    //
    //                                                                    //
    //     ███████████ █████                                              //
    //    ░█░░░███░░░█░░███                                               //
    //    ░   ░███  ░  ░███████    ██████                                 //
    //        ░███     ░███░░███  ███░░███                                //
    //        ░███     ░███ ░███ ░███████                                 //
    //        ░███     ░███ ░███ ░███░░░                                  //
    //        █████    ████ █████░░██████                                 //
    //       ░░░░░    ░░░░ ░░░░░  ░░░░░░                                  //
    //                                                                    //
    //                                                                    //
    //                                                                    //
    //     █████   █████                           ███                    //
    //    ░░███   ░░███                           ░░░                     //
    //     ░███    ░███   ██████  █████████████   ████   ██████           //
    //     ░███████████  ███░░███░░███░░███░░███ ░░███  ███░░███          //
    //     ░███░░░░░███ ░███ ░███ ░███ ░███ ░███  ░███ ░███████           //
    //     ░███    ░███ ░███ ░███ ░███ ░███ ░███  ░███ ░███░░░            //
    //     █████   █████░░██████  █████░███ █████ █████░░██████           //
    //    ░░░░░   ░░░░░  ░░░░░░  ░░░░░ ░░░ ░░░░░ ░░░░░  ░░░░░░            //
    //                                                                    //
    //                                                                    //
    //                                                                    //
    //       █████████                         ██████   ███               //
    //      ███░░░░░███                       ███░░███ ░░░                //
    //     ███     ░░░   ██████  ████████    ░███ ░░░  ████   ███████     //
    //    ░███          ███░░███░░███░░███  ███████   ░░███  ███░░███     //
    //    ░███         ░███ ░███ ░███ ░███ ░░░███░     ░███ ░███ ░███     //
    //    ░░███     ███░███ ░███ ░███ ░███   ░███      ░███ ░███ ░███     //
    //     ░░█████████ ░░██████  ████ █████  █████     █████░░███████     //
    //      ░░░░░░░░░   ░░░░░░  ░░░░ ░░░░░  ░░░░░     ░░░░░  ░░░░░███     //
    //                                                       ███ ░███     //
    //                                                      ░░██████      //
    //                                                       ░░░░░░       //
    //                                                                    //
    //                                                                    //
    ////////////////////////////////////////////////////////////////////////  */
  
# Packages 
  home.packages = with pkgs; [
    bluetuith              # For Bluetooth functionality. Click the icon on the top-right!
    brightnessctl
    eog
    fastfetch
    firefox
    font-awesome           # For icon functionality. Peep the waybar!
    fuzzel
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
    screen
    signal-desktop
    # spotify                # Just as a note, if spotify won't start -> rm -rf $HOME/.cache/spotify/
    tree
    thunderbird
    unzip                  # To unzip files in the command line (Use "unzip!")     
    vlc
    vscode
    waybar
    xwayland               # Ensures compatability with older applications that use X11 (Makes wayland able to display properly)
    zip
  ];

  fonts.fontconfig.enable = true;
}
