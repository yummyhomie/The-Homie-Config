{
  # Jellyfin
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "erik";
    hardwareAcceleration = {
      enable = true;
      type = "vaapi";
      device = "/dev/dri/renderD128";
    };
  };
}
