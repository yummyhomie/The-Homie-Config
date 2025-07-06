{ config, pkgs, lib, ... }:

{
  networking.hostName = "the-homie-machine";

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
