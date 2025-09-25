{
  programs.nixcord = {
    enable = true;          # Enable Nixcord (It also installs Discord)
    # quickCss = "some CSS";  # quickCSS file
    config = {
      useQuickCss = true;   # use our quickCSS
      #themeLinks = [        # or use an online theme
      #  "https://raw.githubusercontent.com/link/to/some/theme.css"
      #];
    };
  };
}
