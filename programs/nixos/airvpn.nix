{
  vpnNamespaces.AirVPN = {
    enable = true;
    wireguardConfigFile = "/etc/vpn/AirVPN_AllServers.conf";

    accessibleFrom = [ "192.168.1.0/24" ];

    portMappings = [{ from = 2283; to = 8080; }];

    openVPNPorts = [{ port = 21353; protocol = "both"; }];
  };

  systemd.services.qbittorrent.vpnConfinement = {
    enable = true;
    vpnNamespace = "AirVPN";
  };

  services.qbittorrent = {
    enable = true;
    webuiPort = 8080;
    torrentingPort = 21353;
    serverConfig = {
      "Preferences" = {
        "WebUI\\Address" = "192.168.15.1";
        "WebUI\\Port" = "8080";
        "Connection\\PortRangeMin" = "21353";
      };
    };
  };
}
