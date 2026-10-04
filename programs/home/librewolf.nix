{
  programs.librewolf = {
    enable = true;
    profiles = {
      default = {
        id = 0;
        isDefault = true;
        extensions.force = true;
        search = {
          force = true;
          default = "DuckDuckGo";
          privateDefault = "DuckDuckGo";
        };
        settings = {
          "ui.key.menuAccessKey" = 0;
          "extensions.activeThemeID" = "default-theme@mozilla.org";
          "browser.uiCustomization.state" = ''{"placements":{"widget-overflow-fixed-list":[],"unified-extensions-area":["sponsorblocker_ajay_app-browser-action","momentum_momentumdash_com-browser-action","_a6c4a591-f1b2-4f03-b3ff-767e5bedf4e7_-browser-action","jid0-bnmfwww2w2w4e4edvcddbnmhdvg_jetpack-browser-action","firefoxcolor_mozilla_com-browser-action"],"nav-bar":["back-button","forward-button","stop-reload-button","vertical-spacer","urlbar-container","search-container","downloads-button","reset-pbm-toolbar-button","unified-extensions-button"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["tabbrowser-tabs","new-tab-button","customizableui-special-spring3","alltabs-button","smartwindow-group-tabs-button","ai-window-toggle"],"vertical-tabs":[],"PersonalToolbar":["personal-bookmarks","ublock0_raymondhill_net-browser-action","_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action","jid1-mnnxcxisbpnsxq_jetpack-browser-action","_6c00218c-707a-4977-84cf-36df1cef310f_-browser-action","idcac-pub_guus_ninja-browser-action","addon_darkreader_org-browser-action"]},"seen":["reset-pbm-toolbar-button","developer-button","screenshot-button","ublock0_raymondhill_net-browser-action","addon_darkreader_org-browser-action","_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action","_a6c4a591-f1b2-4f03-b3ff-767e5bedf4e7_-browser-action","jid1-mnnxcxisbpnsxq_jetpack-browser-action","jid0-bnmfwww2w2w4e4edvcddbnmhdvg_jetpack-browser-action","_6c00218c-707a-4977-84cf-36df1cef310f_-browser-action","idcac-pub_guus_ninja-browser-action","momentum_momentumdash_com-browser-action","sponsorblocker_ajay_app-browser-action","firefoxcolor_mozilla_com-browser-action"],"dirtyAreaCache":["nav-bar","TabsToolbar","vertical-tabs","toolbar-menubar","PersonalToolbar","unified-extensions-area"],"currentVersion":26,"newElementCount":8}'';
        };
      };
      
      I2P = {
        id = 1;
        extensions.force = true;
        bookmarks = {
          force = true;
          settings = [
            {
              bookmarks = [
                { name = "I2P Console"; url = "localhost:7657";}
                { name = "PostMan"; url = "http://tracker2.postman.i2p/"; }
                { name = "NotBob"; url = "http://notbob.i2p";}
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
          # Optional: Do Not Track
          "privacy.donottrackheader.enabled" = true;
        };
      };
    };
  };
}
