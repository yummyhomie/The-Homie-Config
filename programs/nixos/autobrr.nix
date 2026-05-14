{
  systemd.services.autobrr.vpnConfinement = {
    enable = true;
    vpnNamespace = "AirVPN";
  };

  services.autobrr = {
    enable = true;
    openFirewall = true;
    secretFile = "/etc/secrets/autobrrSecretFile";
    settings = {
      host = "0.0.0.0";
      port = 7474;
    };
  };

  networking.firewall.allowedTCPPorts = [ 7474 ];
}
