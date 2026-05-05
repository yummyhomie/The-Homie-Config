{
  services.seerr.enable = true;

  systemd.services.seerr.environment = {
    HOST = "0.0.0.0";
  };

  networking.firewall.allowedTCPPorts = [ 5055 ]; # Default Seerr Web Port
}
