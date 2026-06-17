{ lib, ... }:
{
  services.adguardhome = {
    enable = true;
    mutableSettings = true;
    openFirewall = true;
    host = "0.0.0.0";
    port = 1914;            # Port for the web interface
    allowDHCP = true;
  };

  networking.firewall.allowedTCPPorts = [ 53 1914 ]; # 53 is used for DNS queries. 
  networking.firewall.allowedUDPPorts = [ 53 67 68 ]; # 67 is DHCP Requests, 68 for DHCP Responses.
}
