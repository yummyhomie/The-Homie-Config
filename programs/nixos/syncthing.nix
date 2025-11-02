{
  services.syncthing = {
    enable = true;
    openDefaultPorts = false;
    guiAddress = "10.144.79.39:8384";  # Localhost Only
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
        devices = [ "the-homie-machine" ];
      };

      devices = {
        the-homie-machine = {
          addresses = [ "tcp://10.144.47.44:22000" ];
          id = "5PICSNR-QJCIHQI-YIPDPZO-3IHQZRS-527W5NP-JBK6LWL-2HLGF5B-YMPXOAS";
        };
      };
    };
  };

  networking.firewall.interfaces."ztmoseu2p5".allowedTCPPorts = [ 8384 22000 ];
}
