{
  imports = [
    ../../programs/nixos/mine-server.nix
    ../../programs/nixos/immich.nix
  ];
  
  networking.hostName = "the-dell-server"; # Define your hostname.

  # Version
  system.stateVersion = "24.05";
}
