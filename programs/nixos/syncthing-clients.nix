{
  services.syncthing = {
    enable = true;
    openDefaultPorts = false;
    guiAddress = "127.0.0.1:8384";  # Localhost Only
    user = "erik";
    group = "users";
    configDir = "/home/erik/.config/syncthing";
    
    settings = {
      options = {
        localAnnounceEnabled = false;
        relaysEnabled = true;
      };

      folders."the-homie-notes" = {
        label = "the-homie-notes";
        path = "/home/erik/the-homie-notes";
        devices = [ "the-homie-server" ];
      };

      devices = {
        the-homie-server = {
          addresses = [ "tcp://10.144.79.39.22000" ];
          id = "DMQXJ6F-ZQYUZ3F-2M5AXTG-WSSI27N-KWSVMG6-7BTYECN-6S2U4WZ-YIMCTA6";
        };
      };
    };
  };

  networking.firewall.interfaces."ztmoseu2p5".allowedTCPPorts = [ 22000 ];
}
