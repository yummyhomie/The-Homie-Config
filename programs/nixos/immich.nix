{
  services.immich = {
    enable = true;
    host = "0.0.0.0";
    openFirewall = true;
    machine-learning.enable = true;
    mediaLocation = "/Warehouse/Memories";
  };

  users.users.immich.extraGroups = [ "video" "render" ];
}
