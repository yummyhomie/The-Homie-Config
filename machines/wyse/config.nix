{
  imports = [
    ../../programs/nixos/nginx.nix
    ../../programs/nixos/pihole.nix
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
