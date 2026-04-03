# This newest update seems to cause an error between [colors] & [colors-dark]
# Stylix sets the color, but foot now uses colors-dark. Until a new version 
# fixes this, I get super annoying error messages. 
# Hopefully one day it gets fixed! :,)
{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = "xterm-256color";
        pad = "4x4";
      };
      cursor = {
        style = "block";
        blink = "yes";
        blink-rate = "400";
      };
      mouse = {
        hide-when-typing = "yes";
      };
    };
  };
}
