{ pkgs, inputs, ... }:
let
  gitlogue = inputs.gitlogue.packages.${pkgs.system}.default;
in
{
  # I love screensavers, and this is a neat way I found to have one on wayland. It spawns a terminal and runs this terminal
  # screensaver at fullscreen. When I resume activity, it kills it!

  home.packages = with pkgs; [ gitlogue pipes ];
  
  services.swayidle = {
    enable = true;
    timeouts = [
      { 
        timeout = 300; command = "${pkgs.kitty}/bin/kitty --class screensaver --start-as=fullscreen sh -c 'cd ~/The-Homie-Config && ${gitlogue}/bin/gitlogue --loop'"; 
        # This Does NOT work so far. resumeCommand = "${pkgs.procps}/bin/pkill -f 'kitty.*screensaver'";
      }
    ];
  };
}
