{
  systemd.services.flaresolverr.vpnConfinement = {
    enable = true;
    vpnNamespace = "AirVPN";
  };

  services.flaresolverr = {
    enable = true;
    openFirewall = true; # 8191
  };
}
