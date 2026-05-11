{
  networking.wg-quick.interfaces.airvpn = {
    configFile = "/etc/vpn/AirVPN_AllServers.vpn";
    autostart = false;
  };
}
