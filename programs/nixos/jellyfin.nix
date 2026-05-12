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
    dataDir   = "/Warehouse/Media/Jellyfin/data";
    cacheDir  = "/Warehouse/Media/Jellyfin/cache";
    configDir = "/Warehouse/Media/Jellyfin/config";
    logDir    = "/Warehouse/Media/Jellyfin/log";
  };
}
