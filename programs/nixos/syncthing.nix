{
  services.syncthing = {
    enable = true;
    openDefaultPorts = false;
    guiAddress = "10.144.79.39:8384";
    user = "erik";
    group = "users";
    configDir = "/home/erik/.config/syncthing";
    overrideDevices = false;
    
    settings = {
      options = {
        localAnnounceEnabled = false;
        relaysEnabled = true;
      };

      folders."the-homie-notes" = {
        label = "the-homie-notes";
        path = "/home/erik/the-homie-notes";
        devices = [ "the-homie-machine" "the-homie-phone" "the-work-machine" "the-homie-laptop" ];
      };

      devices = {
        the-homie-machine = {
          addresses = [ "tcp://10.144.47.44:22000" ];
          id = "5PICSNR-QJCIHQI-YIPDPZO-3IHQZRS-527W5NP-JBK6LWL-2HLGF5B-YMPXOAS";
        };
        the-homie-phone = {
          addresses = [ "tcp://10.144.79.43:22000" ];
          id = "DRZ2IQL-SEWUPII-IUTMQA2-5FEVS7Z-3UTCBLR-Y7V773J-RPJGPJN-MTH5FQ6";
        };
        the-work-machine = {
          addresses = [ "tcp://10.144.254.79:22000" ];
          id = "P2SQD2X-4NZ6KWZ-PTLMCRX-SPCPYFO-7YTOIE2-QCS36GR-3B5BTJW-2AUZXAD";
        };
        the-homie-laptop = {
          addresses = [ "tcp://10.144.79.45:22000" ];
          id = "BGGWJTC-NZUZSEQ-KPBUC46-NRXNCVV-FQ473TT-PG2C5AU-GENNS2K-T24TPQ7";
        };
      };
    };
  };

  networking.firewall.interfaces."ztmoseu2p5".allowedTCPPorts = [ 8384 22000 ];
}
