{ pkgs, ... }:
{
  # i2p
  services.i2p.enable = true;
  
  # i2pd
  services.i2pd = {
    enable = true;
    dataDir = "/home/erik/Media";
    proto = {
      http.enable = true;
      socksProxy.enable = true;
      httpProxy.enable = true;
      sam.enable = true;
      i2cp = {
        enable = true;
      };
      i2pControl = {
        enable = true;
      };
    };
  };
}
