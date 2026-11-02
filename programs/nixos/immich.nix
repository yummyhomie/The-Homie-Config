{
  services.immich = {
    enable = true;
    host = "0.0.0.0";
    openFirewall = true;
    mediaLocation = "/Warehouse/Memories";
    
    machine-learning.enable = false;
    accelerationDevices = [ "null" ];

    # To lower how much usage immich can use while processing thumbnails, etc.
    environment = {
      IMMICH_JOB_CONCURRENCY = "1";
      IMMICH_JOB_QUEUE_CONCURRENCY = "1";
    };

    settings = {
      ffmpeg = {
        threads = 1;         # Limit transcoding to 1 CPU thread
        crf = 28;            # Higher = smaller file, less CPU (default is 23)
        preset = "ultrafast"; # Fastest preset, lowest CPU usage
     };
    };
  };

  hardware.graphics.enable = true;

  users.users.immich.extraGroups = [ "video" "render" ];

  networking.firewall.allowedTCPPorts = [ 2283 ]; 
}
