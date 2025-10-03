{ config, pkgs, lib, ... }: {
  services.radicale = {
    enable = true;
    settings = {                                    
      server.hosts = [ "0.0.0.0:5232" "[::]:5232" ];
      
      storage.filesystem_folder = "/var/lib/radicale/collections";
      
      auth = {                                      
        type = "htpasswd";            
        htpasswd_filename = "/var/lib/radicale/users";            
        htpasswd_encryption = "bcrypt";
      };
    };
  };
}
