{
  programs.nixcord = {
    enable = true;          # Enable Nixcord (It also installs Discord)
    vesktop.enable = true;  # Vesktop
    dorion.enable = true;   # Dorion
    quickCss = "some CSS";  # quickCSS file
    config = {
      useQuickCss = true;   # use our quickCSS
      #themeLinks = [        # or use an online theme
      #  "https://raw.githubusercontent.com/link/to/some/theme.css"
      #];
      frameless = true;                   # Set some Vencord options
      plugins = {
        #hideAttachments.enable = true;    # Enable a Vencord plugin
        #ignoreActivities = {              # Enable a plugin and set some options
        #  enable = true;
        #  ignorePlaying = true;
        #  ignoreWatching = true;
        #  ignoredActivities = [ "someActivity" ];
        #};
      };
    };
    dorion = {
      theme = "dark";
      zoom = "1.1";
      blur = "acrylic";       # "none", "blur", or "acrylic"
      sysTray = true;
      openOnStartup = true;
      autoClearCache = true;
      disableHardwareAccel = false;
      rpcServer = true;
      rpcProcessScanner = true;
      pushToTalk = true;
      pushToTalkKeys = ["RControl"];
      desktopNotifications = true;
      unreadBadge = true;
    };
    extraConfig = {
      # Some extra JSON config here
      # ...
    };
  };
}
