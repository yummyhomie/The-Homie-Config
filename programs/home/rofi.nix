{
  programs.rofi = {
    enable = true;
    cycle = false;

    extraConfig = {
      modi = "drun,filebrowser";
      font = "monospace 14";
      show-icons = true;
      disable-history = true;
      hover-select = true;
      bw = 0;
      display-drun = "";
      display-window = "";
      display-combi = "";
      terminal = "foot";
      drun-match-fields = "name";
      drun-display-format = "{name}";
      me-select-entry = "";
      me-accept-entry = "MousePrimary";
      kb-cancel = "Escape,MouseMiddle";
    };
  };
}
