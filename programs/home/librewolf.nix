{
  programs.librewolf = {
    enable = true;

    profiles = {
      Default = {
        id = 0;
        extensions.force = true;
      };
      
      I2P = {
        id = 1;
        extensions.force = true;
        bookmarks = {
          force = true;
          settings = [
            {
              name = "pluh";
              toolbar = true;
              bookmarks = [
                {
                  name = "I2P Console";
                  url = "localhost:7657";
                }
                {
                  name = "PostMan";
                  url = "http://tracker2.postman.i2p/";
                }
                {
                  name = "NotBob";
                  url = "http://notbob.i2p";
                }
              ];
            }
          ];
        };
        settings = {
          # Manual Proxy Configuration
          "network.proxy.type" = 1;  # 1 = Manual proxy configuration

          # HTTP Proxy on port 4444 (also used for HTTPS)
          "network.proxy.http" = "127.0.0.1";
          "network.proxy.http_port" = 4444;
          "network.proxy.ssl" = "127.0.0.1";
          "network.proxy.ssl_port" = 4444;
          "network.proxy.share_proxy_settings" = true;  # Use HTTP proxy for HTTPS

          # SOCKS Host on port 4447 with SOCKS v5
          "network.proxy.socks" = "127.0.0.1";
          "network.proxy.socks_port" = 4447;
          "network.proxy.socks_version" = 5;  # SOCKS v5

          # Proxy DNS when using SOCKS v5
          "network.proxy.socks_remote_dns" = true;

          # Enhanced Tracking Protection - Strict
          "browser.contentblocking.category" = "strict";

          # HTTPS-Only Mode - Disabled
          "dom.security.https_only_mode" = false;
          "dom.security.https_only_mode_ever_enabled" = false;

          # Optional: Delete cookies after every session
          "network.cookie.lifetimePolicy" = 2;  # 2 = Accept for session only
          "privacy.clearOnShutdown.cookies" = true;
          "privacy.clearOnShutdown.cache" = true;

          # Optional: Do Not Track
          "privacy.donottrackheader.enabled" = true;
        };
      };
    };

    settings = {
      "identity.fxaccounts.enabled" = true;
      "ui.key.menuAccessKeyFocuses" = false;
      
      # Dark mode preferences
      "ui.systemUsesDarkTheme" = 1;
      "browser.theme.dark-private-windows" = true;
      "browser.theme.content-theme" = 0;
      "browser.theme.toolbar-theme" = 0;
      "layout.css.prefers-color-scheme.content-override" = 0;
    };
  };
}
