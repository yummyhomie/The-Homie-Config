{ pkgs, lib, ... }:
{
  # Niri
  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [ xwayland-satellite ];

  # Environment Variables (To help various programs to use the correct WM Protocol)
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # Let Electron Apps know to use Wayland
  };

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
      niri = lib.mkForce {
        default = [ "wlr" "gtk" ];
      };
    };
  };
}
