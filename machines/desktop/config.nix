{
  imports = [ ];

  networking.hostName = "the-homie-machine";

  hardware.amdgpu.initrd.enable = true;

  fileSystems."/home/erik/storage" = {
    device = "/dev/disk/by-uuid/a4718a62-69f8-4dda-96bc-3a665c60fae8";
    fsType = "ext4";
    options = [ "defaults" "users" "exec" ];
  };
}
