{ pkgs, ... }:
{
  # Put host specific home-manager modules here! 

  home.packages = with pkgs; [
    kdePackages.kdenlive
  ];
}
