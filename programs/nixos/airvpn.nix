{ 
  # This creates the container to bind services to use the AirVPN service!
  vpnNamespaces.AirVPN = {
    enable = true;
    wireguardConfigFile = "/etc/vpn/AirVPN_Netherlands.conf";
    accessibleFrom = [ "192.168.1.0/24" ];
    portMappings = [
      { from = 2283; to = 8080; } # For Qbittorrent
      { from = 9696; to = 9696; } # For Prowlarr
      { from = 7474; to = 7474; } # For Autobrr
    ];
    openVPNPorts = [{ port = 21353; protocol = "both"; }];
  };

  networking.wg-quick.interfaces.airvpn = {
    configFile = "/etc/vpn/AirVPN_AllServers.conf";
    autostart = false;
  };
}
