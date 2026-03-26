{
  imports = [ ];

  networking.hostName = "the-homie-machine";

  hardware.amdgpu.initrd.enable = true;
  
  fileSystems."/home/erik/1TB-Storage" = {
    device = "/dev/disk/by-uuid/ab8510e1-fb9d-4fd7-a690-09135f7d8ad3";
    fsType = "ext4";
    options = [ "defaults" "users" "exec" ];
  };

  fileSystems."/home/erik/2TB-Storage" = {
    device = "/dev/disk/by-uuid/a4718a62-69f8-4dda-96bc-3a665c60fae8";
    fsType = "ext4";
    options = [ "defaults" "users" "exec" ];
  };

  # If you have issues writing to the drives 
  # sudo chown -R $USER:$USER /path
  # chmod -R 755 /path

  # Version
  system.stateVersion = "24.05";
}
