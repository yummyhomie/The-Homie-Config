{
  imports = [ ../../programs/nixos/gaming.nix ];

  networking.hostName = "the-homie-laptop";

  # USB Ports
  boot.kernelParams = [ "usbcore.autosuspend=-1" ];
}
