{ config, pkgs, ... }:
  # Import home-manager modules & configs for all machines here!
{
  imports = [
    ../firefox.nix
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
    capacities
    eog                    # Gnome image viewer 
    fastfetch
    font-awesome           # For icon functionality. Peep the waybar!
    gimp
    gvfs                   # This helps with connecting to remote folders via nautilus
    htop
    libreoffice-qt6-fresh
    nautilus
    ncdu                   # To checkout Disk Usage
    networkmanager
    nmap
    obs-studio
    obsidian
    openconnect            # Use instead of cisco anyconnect (sudo openconnect [server] --useragent=AnyConnect)
    p7zip
    prismlauncher
    pulsemixer
    r2modman
    screen                 # For interfacing with mgmt ports
    signal-desktop
    # spotify              # Just as a note, if spotify won't start -> rm -rf $HOME/.cache/spotify/
    tailwindcss_4
    tree
    thunderbird
    unzip                  # To unzip files in the command line (Use "unzip!")     
    vlc
    vscodium
    waybar
    wbg                    # Ultra light wallpaper application. Ran on autostart with Niri.
    xwayland               # Ensures compatability with older applications that use X11 (Makes wayland able to display properly)
    zip

    gimp
  ];

  fonts.fontconfig.enable = true;
}
