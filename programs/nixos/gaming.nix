{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
    protontricks.enable = true;
  };

  programs.gamemode.enable = true; # Remember to use "gamemoderun %command%" as startup options for steam games
  
  programs.gamescope = {
    enable = true;
    capSysNice = false;
  };

  hardware.cpu.amd.updateMicrocode = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  
  programs.corectrl.enable = true;

  environment.systemPackages = with pkgs; [
    mangohud
    nvtopPackages.amd
  ];
}
