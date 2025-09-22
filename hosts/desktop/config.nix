{
  networking.hostName = "the-homie-machine";

  # Gaming
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = ["amdgpu"];

  hardware.amdgpu.initrd.enable = true;
}
