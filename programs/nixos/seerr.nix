{
  services.seerr.enable = true;

  networking.firewall.allowedTCPPorts = [ 5055 ]; # Default Seerr Web Port
}
