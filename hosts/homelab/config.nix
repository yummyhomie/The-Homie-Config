{config, pkgs, inputs, ... }:

{
  imports = [
      ./services/default.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "the-homie-server"; # Define your hostname.
   
  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Denver";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Users
  users.users.erik = {
    isNormalUser = true;
    description = "Erik";
    extraGroups = [ "networkmanager" "wheel" "i2p" "i2pd" "jellyfin" "media" "docker" "copyparty" ];
    packages = with pkgs; [];
  };

  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.warn-dirty = false;

  # Packages & Programs Installed onto this System
  environment.systemPackages = with pkgs; [
    btop
    docker-compose
    dua
    inotify-tools
    nmap
    tmux
  ];

  # Allow UnFree Packages
  nixpkgs.config.allowUnfree = true;

  # SSH
  services.openssh.enable = true;

  # Docker
  virtualisation.docker.enable = true;

  # Networking & Firewall Configs
  networking.firewall.enable = true;
  networking.firewall.allowPing = true;

  networking.firewall.allowedTCPPorts = [ 22 80 8080 443 7070 7657 4444 16261 16262 27015 3923 ]; # 7070 & 4444 for i2pd. 7657-67 for i2p snark
  networking.firewall.allowedUDPPorts = [ 22 80 8080 443 7070 7657 4444 16261 16262 27015 3923 ]; # 7070 & 4444 for i2pd. 7657-67 for i2p snark

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}

  # Notes
  # NixOS makes it easier to fully remove services and programs, but sometimes, you will need to do some manual digging. 
  # This is the best way I've found to be able to fully remove a service from this nixOS System. 
  # 
  #1. Remove from NixOS Configuration File (duh lmao)
  #2. Rebuild System (sudo nixos-rebuild switch)
  #3. Clean up old Generations (optional) [sudo nix-collect-garbage -d]
  #4. Manually remove persistent data (/var/lib, /etc, /run)
    # sudo find /var /etc /run -name "*NAME-HERE*"
    # Then rm -rf that mofo
  #5. Optional, run these to improve system. Maybe. 
    # sudo nix-store --gc
    # sudo nix-store --optimize
