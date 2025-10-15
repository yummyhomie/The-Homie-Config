{ pkgs, ... }:
{
  # Niri
  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [ xwayland-satellite ];

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk  # This should work now with xwayland-satellite
    ];
    config = {
      common = {
        default = [ "wlr" "gtk" ];
      };
      niri = {
        default = [ "wlr" "gtk" ];
      };
    };
  };
}
