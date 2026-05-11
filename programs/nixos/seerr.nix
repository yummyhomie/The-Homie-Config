{
  services.seerr.enable = true;

  systemd.services.seerr.environment = {
    HOST = "0.0.0.0";
  };

  services.sonarr = {
    enable = true;
    openFirewall = true;
    group = "media";
  };
  
  services.prowlarr = {
    enable = true;
    openFirewall = true;
  };

  users.groups.media = {};
  users.groups.prowlarr = {};

  users.users.prowlarr = {
    isSystemUser = true;
    group = "prowlarr";
    extraGroups = [ "media" ];
  };
  
  networking.firewall.allowedTCPPorts = [ 
    5055  # Seerr
    8989  # Sonarr
    9696  # Prowlarr
  ]; 
}
