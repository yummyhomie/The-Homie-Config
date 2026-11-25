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
    bluetuith              # For Bluetooth functionality. Click the icon on the top-right!
    brightnessctl
    burpsuite
    chromium
    dig
    dnsenum
    easyeffects
    eog                    # Gnome image viewer
    evolution              # For Gnome-Calendar to work with CalDav Servers
    fastfetch
    gimp
    gnome-calendar
    htop
    joplin-desktop
    jq
    libreoffice
    metasploit
    nautilus
    nerd-fonts.symbols-only
    networkmanager
    nmap
    nodejs_26              # For HTB reader
    obsidian
    openvpn
    p7zip
    pulsemixer
    signal-desktop
    # spotify              # Just as a note, if spotify won't start -> rm -rf $HOME/.cache/spotify/
    tailwindcss_4
    thunar
    tree
    tutanota-desktop
    unzip                  # To unzip files in the command line (Use "unzip!")     
    vlc
    waybar
    wbg                    # Ultra light wallpaper application. Ran on autostart with Niri.
    whois
    wireguard-tools
    zap
    zip
  ];

  fonts.fontconfig.enable = true;

  # System StateVersion Fixes for Home Manager (Since my build is older than 25.05)
  # wayland.windowManager.hyprland.configType = "hyprlang";
}
