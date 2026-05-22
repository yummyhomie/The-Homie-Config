{
  systemd.services.flaresolverr = {
    vpnConfinement = {
      enable = true;
      vpnNamespace = "AirVPN";
    };
    
    bindsTo = [ "AirVPN.service" ];
    after = [ "AirVPN.service" ];
  };

  services.flaresolverr = {
    enable = true;
    openFirewall = true; # 8191
  };
}
