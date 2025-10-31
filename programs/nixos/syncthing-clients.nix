{
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    guiAddress = "127.0.0.1:8384";  # Localhost Only
    user = "erik";
    group = "users";
    configDir = "/home/erik/.config/syncthing";
    
    settings = {
      options = {
        localAnnounceEnabled = false;
        relaysEnabled = false;
      };

      folders."the-homie-notes" = {
        label = "the-homie-notes";
        path = "/home/erik/the-homie-notes";
      };    
    };
  };

  networking.firewall.interfaces."ztmoseu2p5".allowedTCPPorts = [ 22000 ];
}
