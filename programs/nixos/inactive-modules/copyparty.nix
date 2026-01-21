{
  services.copyparty = {
    enable = true;
    user = "copyparty"; 
    group = "copyparty"; 
    settings = {
      i = "0.0.0.0";
      p = [ 3210 3211 ];
      no-reload = true;
      ignored-flag = false;
    };

    accounts = {
      erik = {
        passwordFile = "/home/erik/Keys/copyparty_password";
      };
    };

    volumes = {
      "/" = {
        path = "/home/erik/CopyParty";
        access = {
          r = "erik";
          rw = [ "erik" ];
        };
        flags = {
          fk = 4;
          scan = 60;
          e2d = true;
          d2t = true;
          nohash = "\.iso$";
        };
      };
    };
    openFilesLimit = 8192;
  };

  networking.firewall.allowedTCPPorts = [ 3210 3211 ];
}
