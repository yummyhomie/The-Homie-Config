{ config, pkgs, lib, ... }: {

  services.radicale = {
    enable = true;
    settings = {                                    
      auth = {                                      
        type = "htpasswd";            
        htpasswd_filename = "/var/lib/radicale/users";            
        htpasswd_encryption = "bcrypt";
      };    

      server.hosts = [ "0.0.0.0:5232" "[::]:5232" ];
      storage.filesystem_folder = "/var/lib/radicale/collections";
      web = {                                                                                            
        type = "radicale_infcloud";
        # The weird spacing here is on purpose to hack the INI formatter
        infcloud_config = ''
          globalInterfaceLanguage = "en_US";
                          globalTimeZone = "America/Denver";
        '';                                         
      };          
    };     
  };                                                
                                                    
  systemd.services.radicale.environment.PYTHONPATH = 
    let    
      python = pkgs.python3.withPackages (ps: with ps; [
        radicale-infcloud
        pytz                                                                                             
        setuptools  
      ]);
    in
    "${python}/${pkgs.python3.sitePackages}";
}

# For updating/creating users & passwords:                                                               
# sudo -u radicale htpasswd -bB /var/lib/radicale/users <username> <newpassword>
