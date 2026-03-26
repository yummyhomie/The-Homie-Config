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
