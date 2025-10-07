{
  # NginX Reverse Proxy
  services.nginx = {
    enable = true;

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

    # DAVIS
    virtualHosts."davis.cyscuvu.com" = {
      forceSSL = true;
      enableACME = true;
      
      locations."/" = {
        proxyPass = "http://192.168.1.8:1945";
        proxyWebsockets = true;
        extraConfig = ''
          proxy_set_header Host $host;
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_set_header X-Forwarded-Proto $scheme;
          proxy_set_header X-Forwarded-Host $host;
          proxy_set_header X-Forwarded-Port $server_port;
          
          # CalDAV specific headers
          proxy_set_header Destination $http_destination;
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
