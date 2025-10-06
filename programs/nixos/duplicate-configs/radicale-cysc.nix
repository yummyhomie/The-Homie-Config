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

    rights = {
      # Anonymous users can read all calendars
      anonymous = {
        user = ".*";  # Match any user (including anonymous)
        collection = ".*";  # Match any collection
        permissions = "r";  # Read only
      };
        
      # Authenticated users (admins) can read and write their own calendars
      owner = {
        user = ".+";  # Match any authenticated user
        collection = "{user}/.*";  # Their own collections
        permissions = "RrWw";  # Full read/write access
      };
    };
  };
}

# Create the first user & set the password
# sudo htpasswd -B -c /var/lib/radicale/users USERNAME

# Add subsequent users (-c) overwrites everything!
# sudo htpasswd -B /var/lib/radicale/users USERNAME-2

# nix-shell -p apacheHttpd if htpasswd isn't installed. 
