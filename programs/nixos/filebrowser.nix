{
  services.filebrowser = {
    enable = true;
    openFirewall = true;
    user = "erik";
    settings = {
      address = "0.0.0.0";
      port = 2023;
    };
  };

  networking.firewall.allowedTCPPorts = [ 2023 ];
}
