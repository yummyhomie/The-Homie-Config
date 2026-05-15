{ pkgs, ... }:
{
  programs.nixcord = {
    enable = true;
    config = { useQuickCss = true; };
  };
}
