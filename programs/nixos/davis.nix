{
  services.davis = {
    enable = true;
    hostname = "davis.cyscuvu.com";
    adminLogin = "admin";
    adminPasswordFile = "/home/erik/davis-admin-pass";
    appSecretFile = "/home/erik/davis-appsecret";
    nginx = {
      # Listen on port 1945 internally
      listen = [
        {
          addr = "0.0.0.0";
          port = 1945;
        }
      ];
      serverAliases = [ "davis.cyscuvu.com" ];
      # Disable SSL on the Davis server since the reverse proxy will handle it
      forceSSL = false;
      enableACME = false;
    };
  };

  # Open the firewall for port 1945
  networking.firewall.allowedTCPPorts = [ 1945 ];
}

# Fill the adminPasswordFile with the password of your choice!
# Refer to https://mynixos.com/nixpkgs/option/services.davis.appSecretFile to generate the appSecretFile

