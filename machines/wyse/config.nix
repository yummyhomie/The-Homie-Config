{
  imports = [
    ../../programs/nixos/adguard.nix
    ../../programs/nixos/nginx.nix
  ];
  
  networking.hostName = "the-wyse-homie";

  # Firewall
  networking.firewall.allowedTCPPorts = [ 80 443 ];

  # Version
  system.stateVersion = "24.05";
}
