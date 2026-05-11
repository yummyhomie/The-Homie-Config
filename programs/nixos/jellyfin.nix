{
  # Jellyfin
  services.jellyfin = {
    enable = true;
    group = "users";
    openFirewall = true;
    hardwareAcceleration = {
      enable = true;
      type = "vaapi";
      device = "/dev/dri/renderD128";
    };
  };

  #users.users.jellyfin.extraGroups = [ "media" ];
}
