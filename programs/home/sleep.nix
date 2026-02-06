{ pkgs, ... }:
{
  services.swayidle = {
    enable = true;
    timeouts = [
      { timeout = 120; command = "${pkgs.systemd}/bin/systemctl suspend"; }
    ];
  };
}
