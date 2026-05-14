{
  systemd.services.prowlarr.vpnConfinement = {
    enable = true;
    vpnNamespace = "AirVPN";
  };

  services.prowlarr = {
    enable = true;
    openFirewall = true;
  };

  networking.firewall.allowedTCPPorts = [ 9696 ]; 
}
