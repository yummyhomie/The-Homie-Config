{
  programs.rofi = {
    enable = true;
    cycle = false;
    theme.window.width = 400;

    extraConfig = {
      modi = "drun,filebrowser";
      font = "monospace 14";
      show-icons = true;
      disable-history = true;
      hover-select = true;
      display-drun = "";
      display-window = "";
      display-combi = "";
      drun-match-fields = "name";
      drun-display-format = "{name}";
      me-select-entry = "";
      me-accept-entry = "MousePrimary";
      kb-cancel = "Escape,MouseMiddle";
    };
  };
}
