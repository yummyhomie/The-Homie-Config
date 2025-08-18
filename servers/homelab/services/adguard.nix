{
  services.adguardhome = {
    enable = true;
    mutableSettings = true;
    openFirewall = true;
    host = "0.0.0.0";
    port = 1914;            # Port for the web interface
  };

  networking.firewall.allowedTCPPorts = [ 53 1914 ]; # 53 is used for DNS queries.
  networking.firewall.allowedUDPPorts = [ 53 ];
}
