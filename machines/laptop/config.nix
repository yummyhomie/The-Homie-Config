{
  imports = [ ];

  networking.hostName = "the-homie-laptop";

  # USB Ports
  boot.kernelParams = [ "usbcore.autosuspend=-1" ];

  # Users
  users.users.erik.extraGroups = [ "dialout" ];

  # Version
  system.stateVersion = "24.05";
}
