{ pkgs, ... }:
{
  # Jellyfin
  services.jellyfin = {
    enable = true;
    group = "media";
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

  # Intel GPU + VAAPI support
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver    # newer Intel iGPUs (Broadwell+)
      intel-vaapi-driver    # older Intel iGPUs fallback
      intel-compute-runtime # OpenCL
    ];
  };

  # Load GuC/HuC firmware for hardware encoding
  boot.kernelParams = [ "i915.enable_guc=2" ];

  # For Hardware Decoding
  users.users.jellyfin.extraGroups = [ "render" "video" ];
}
