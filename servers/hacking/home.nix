{ config, pkgs, ... }:
{
  imports = []; # Maybe one day this'll have imports!

  home.username = "erik";
  home.homeDirectory = "/home/erik";
  home.stateVersion = "25.05"; 

  home.packages = [ ];

  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
}
