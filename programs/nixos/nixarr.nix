{ lib, ... }:
{
  # Radarr
  services.radarr = {
    enable = true;
    openFirewall = true;
    group = "media";
  };

  systemd.services.radarr = {
    after = [ "qbittorrent.service" "network-online.target" ];
    wants = [ "qbittorrent.service" ];

    serviceConfig = {
      UMask = lib.mkForce "0002";
    };
  };

  # Seerr
  services.seerr.enable = true;
  systemd.services.seerr.environment = { HOST = "0.0.0.0"; };


  # Sonarr
  services.sonarr = {
    enable = true;
    openFirewall = true;
    group = "media";
  };

  systemd.services.sonarr = {
    after = [ "qbittorrent.service" "network-online.target" ];
    wants = [ "qbittorrent.service" ];
  };

  # Prowlarr
  systemd.services.prowlarr = {
    vpnConfinement = {
      enable = true;
      vpnNamespace = "AirVPN";
    };
    bindsTo = [ "AirVPN.service" ];
    after = [ "AirVPN.service" ];
  };

  services.prowlarr = {
    enable = true;
    openFirewall = true;
  };

  users.groups.media = {};
  users.users.radarr.extraGroups      = [ "media" ];
  users.users.sonarr.extraGroups      = [ "media" ];
  users.users.jellyfin.extraGroups    = [ "media" ];
  users.users.qbittorrent.extraGroups = [ "media" ];

  networking.firewall.allowedTCPPorts = [ 
    5055  # Seerr
    7878  # Radarr
    8989  # Sonarr
    9696  # Prowlarr
  ]; 
}
