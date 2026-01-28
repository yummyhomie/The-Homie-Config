{
  # NginX Reverse Proxy
  services.nginx = {
    enable = true;
    
    # ADGUARD
    virtualHosts."ad.eleedee.net" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:1914";  # AdGuard port
        proxyWebsockets = true;
        extraConfig = ''
          proxy_set_header Host $host;
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_set_header X-Forwarded-Proto $scheme;
        '';
      };
    };

    # FILEBROWSER
    virtualHosts."file.eleedee.net" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:2023";
        proxyWebsockets = true;
        extraConfig = '' 
          proxy_set_header Host $host;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_set_header X-Remote-User $remote_user;
          proxy_pass_header Authorization;
        '';
      };
    };
    
    # IMMICH
    virtualHosts."immich.eleedee.net" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://192.168.1.8:2283";
        proxyWebsockets = true;
        recommendedProxySettings = true;
        extraConfig = ''
          client_max_body_size 50000M;
          proxy_read_timeout   600s;
          proxy_send_timeout   600s;
          send_timeout         600s;
          proxy_set_header Host $host;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_set_header X-Remote-User $remote_user;
          proxy_pass_header Authorization;
        '';
      };
    };

    # JELLYFIN
    virtualHosts."media.eleedee.net" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:8096";  # Default Jellyfin port
        proxyWebsockets = true;
        extraConfig = ''
          proxy_set_header Host $host;
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_set_header X-Forwarded-Proto $scheme;
        '';
      };
    };

    # RADICALE
    virtualHosts."rad.eleedee.net" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:5232";
        proxyWebsockets = true;
        extraConfig = '' 
          proxy_set_header Host $host;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_set_header X-Remote-User $remote_user;
          proxy_pass_header Authorization;
        '';
      };
    };
  };

  # SSL/TLS
  security.acme = {
    acceptTerms = true;
    defaults.email = "eleedee@outlook.com";
  };
}
