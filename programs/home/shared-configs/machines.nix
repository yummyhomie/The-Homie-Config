{ config, pkgs, ... }:
  # Import home-manager modules & configs for all machines here!
{
  imports = [
    ../foot.nix
    ../kitty.nix
    ../librewolf.nix
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
    chromium
    easyeffects
    eog                    # Gnome image viewer
    evolution              # For Gnome-Calendar to work with CalDav Servers
    fastfetch
    freerdp
    font-awesome           # For icon functionality. Peep the waybar!
    gimp
    gnome-calendar
    gvfs                   # This helps with connecting to remote folders via nautilus
    htop
    jq                     # For waybar VPN module
    libreoffice-qt6-fresh
    metadata-cleaner       # For my projects!
    nautilus
    networkmanager
    nmap
    obs-studio
    obsidian
    openconnect            # Use instead of cisco anyconnect (sudo openconnect [server] --useragent=AnyConnect)
    openvpn
    p7zip
    prismlauncher
    pulsemixer
    r2modman
    remmina
    screen                 # For interfacing with mgmt ports
    signal-desktop
    # spotify              # Just as a note, if spotify won't start -> rm -rf $HOME/.cache/spotify/
    sqlitebrowser
    tailwindcss_4
    texlivePackages.tex-gyre
    tree
    thunderbird
    unzip                  # To unzip files in the command line (Use "unzip!")     
    vesktop
    vlc
    vscodium
    waybar
    wbg                    # Ultra light wallpaper application. Ran on autostart with Niri.
    wireguard-tools
    xwayland               # Ensures compatability with older applications that use X11 (Makes wayland able to display properly)
    zip
  ];

  fonts.fontconfig.enable = true;

  # System StateVersion Fixes for Home Manager (Since my build is older than 25.05)
  gtk.gtk4.theme = null;
}
