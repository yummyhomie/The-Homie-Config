{
  networking.wg-quick.interfaces.airvpn = {
    configFile = "/etc/vpn/AirVPN_AllServers.conf";
    autostart = false;
  };
}
