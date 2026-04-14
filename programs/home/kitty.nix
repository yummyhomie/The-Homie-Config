{
  programs.kitty = {
    enable = true;
    shellIntegration.enableBashIntegration = true;
    enableGitIntegration = true;
    settings = {
      window_padding_width = 2;
      cursor_trail = 8;
      term = "xterm-256color";
      confirm_os_window_close = 0;
    };
  };
}
