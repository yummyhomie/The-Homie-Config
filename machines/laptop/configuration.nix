{ config, pkgs, lib, ... }:

{
  networking.hostName = "the-homie-laptop";

  # ZeroTier
  services.zerotierone = {
    enable = true;
    joinNetworks = [ "60ee7c034a366ab7" ];
  };
}
