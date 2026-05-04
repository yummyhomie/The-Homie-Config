{
  imports = [
    ../../programs/nixos/adguard.nix
    ../../programs/nixos/nginx.nix
  ];
  
  networking.hostName = "the-wyse-homie";

  # Firewall
  networking.firewall.allowedTCPPorts = [
    80        # NginX
    443       # NginX
  ];

  # Version
  system.stateVersion = "24.05";
}
