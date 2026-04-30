{
  imports = [
    ../../programs/nixos/nginx.nix
    ../../programs/nixos/pihole.nix
  ];
  
  networking.hostName = "the-wyse-homie";

  # Version
  system.stateVersion = "24.05";
}
