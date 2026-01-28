{
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
    };     
  };                                                
}

# For updating/creating users & passwords:                                                               
# sudo -u radicale htpasswd -bB /var/lib/radicale/users <username> <newpassword>
