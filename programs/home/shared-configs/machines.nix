{ config, pkgs, ... }:
  # Import home-manager modules & configs for all machines here!
{
  imports = [
    ../firefox.nix
    ../foot.nix
    ../kitty.nix
    #../nixcord.nix
    ../rofi.nix
    ../spicetify.nix
    ../stylix-home.nix
    ../vscodium.nix
    ../yambar.nix
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
    beyond-all-reason
    bluetuith              # For Bluetooth functionality. Click the icon on the top-right!
    brightnessctl
    burpsuite 
    discord
    easyeffects
    eog                    # Gnome image viewer
    evolution              # For Gnome-Calendar to work with CalDav Servers
    # exegol                 # HACKTHEPLANET
    fastfetch
    # font-awesome           # For icon functionality. Peep the waybar!
    gimp
    gnome-calendar
    gvfs                   # This helps with connecting to remote folders via nautilus
    htop
    jq                     # For waybar VPN module
    libreoffice-qt6-fresh
    networkmanager
    nerd-fonts.symbols-only
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
    thunar
    tree
    unzip                  # To unzip files in the command line (Use "unzip!")     
    vesktop
    vlc
    waybar
    wbg                    # Ultra light wallpaper application. Ran on autostart with Niri.
    wireguard-tools
    xwayland               # Ensures compatability with older applications that use X11 (Makes wayland able to display properly)
    zip

    protontricks
    binutils
    gcc
  ];

  fonts.fontconfig.enable = true;

  # System StateVersion Fixes for Home Manager (Since my build is older than 25.05)
  wayland.windowManager.hyprland.configType = "hyprlang";
}
