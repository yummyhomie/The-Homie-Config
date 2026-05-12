{
  services.seerr.enable = true;

  systemd.services.seerr.environment = {
    HOST = "0.0.0.0";
  };

  services.sonarr = {
    enable = true;
    openFirewall = true;
    group = "users";
  };
  
  services.radarr = {
    enable = true;
    openFirewall = true;
    group = "users";
  };
  
  services.prowlarr = {
    enable = true;
    openFirewall = true;
  };

  networking.firewall.allowedTCPPorts = [ 
    5055  # Seerr
    7878  # Radarr
    8989  # Sonarr
    9696  # Prowlarr
  ]; 
}
