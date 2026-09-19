{ pkgs, lib, ... }:
{
  # Niri
  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [ xwayland-satellite ];

  # Environment Variables (To help various programs to use the correct WM Protocol)
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";  # Let Electron Apps know to use Wayland
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

  # Steam UI fix by pinning xwayland to 0.8.1
  nixpkgs.overlays = [
    (final: prev: {
      xwayland-satellite = prev.xwayland-satellite.overrideAttrs (old: rec {
        version = "0.8.1";
        src = final.fetchFromGitHub {
          owner = "Supreeeme";
          repo = "xwayland-satellite";
          rev = "536bd32";
          hash = "sha256-BUE41HjLIGPjq3U8VXPjf8asH8GaMI7FYdgrIHKFMXA=";
        };
        cargoDeps = final.rustPlatform.fetchCargoVendor {
          inherit (old) pname;
          inherit version src;
          hash = "sha256-16L6gsvze+m7XCJlOA1lsPNELE3D364ef2FTdkh0rVY=";
        };
      });
    })
  ];
}
