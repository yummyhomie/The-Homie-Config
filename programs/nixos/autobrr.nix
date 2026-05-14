{
  systemd.services.autobrr.vpnConfinement = {
    enable = true;
    vpnNamespace = "AirVPN";
  };

  services.autobrr = {
    enable = true;
    openFirewall = true;  # 7474
    secretFile = "/etc/vpn/autobrrSecretFile";
    settings = {
      host = "0.0.0.0";
      port = 7474;
    };
  };
}
