{
  # Samba
  services.samba = {
    enable = true;
    openFirewall = true;
    settings = {
      global = {
        "invalid users" = [ "root" ];
        "passwd program" = "/run/wrappers/bin/passwd %u";
        security = "user";        
      };
      shares = {
        path = "/home/erik/files/";
        browseable = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "create mask" = "0644";    # Owner RW (6), group R (4), others R (4). This is for Files.
        "directory mask" = "0755"; # Owner RWX (7), group RX (5), others RX (5). This is for Directories
      };
    }; 
  };
}
