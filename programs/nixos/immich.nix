{
  services.immich = {
    enable = true;
    host = "0.0.0.0";
    openFirewall = true;
    accelerationDevices = null; # Uses any acceleration device.
  };

  users.users.immich.extraGroups = [ "video" "render" ];
}
