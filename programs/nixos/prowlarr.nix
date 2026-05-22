{
  systemd.services.prowlarr = {
    vpnConfinement = {
      enable = true;
      vpnNamespace = "AirVPN";
    };
    
    bindsTo = [ "AirVPN.service" ];
    after = [ "AirVPN.service" ];
  };

  services.prowlarr = {
    enable = true;
    openFirewall = true;
  };

  networking.firewall.allowedTCPPorts = [ 9696 ]; 
}
