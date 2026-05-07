{ pkgs, ... }:
{
  services.i2p.enable = true;

  services.i2pd = {
    enable = true;
    address = "127.0.0.1";
    port = 21005;           # For TCP & UDP
    bandwidth = 25000;      # About 200 MBps (20% of 1 GBps)
    floodfill = true;       # Benefits the i2p network by being a floodfill node (look it up) 

    proto = {
      http.enable = true;
      socksProxy.enable = true;
      httpProxy.enable = true;
      
      sam = {
        enable = true; 
        address = "127.0.0.1";
        port = 7656;
      };

      i2cp = {
        enable = true;
        port = 7655;        # So it doesn't conflict with default i2p port
      };

      i2pControl = {
        enable = true;
      };
    };

    ntcp2 = {
      enable = true;
      port = 21005;
      published = true;
    };

    ssu2 = {
      enable = true;
      port = 21005;
      published = true;
    };
  };

  networking.firewall.allowedTCPPorts = [ 21005 ];
  networking.firewall.allowedUDPPorts = [ 21005 ];
}
