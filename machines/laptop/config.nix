{
  imports = [ ../../programs/nixos/gaming.nix ];

  networking.hostName = "the-homie-laptop";

  # USB Ports
  boot.kernelParams = [ "usbcore.autosuspend=-1" ];

  # Version
  system.stateVersion = "24.05";
}
