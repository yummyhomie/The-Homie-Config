{
  # Samba
  services.samba = {
    enable = true;
    openFirewall = true;
    settings = {
      global = {
        security = "user";
        "invalid users" = [ "root" ];
        "guest account" = "nobody";
        "map to guest" = "never";
      };
      Files = {
        path = "/home/erik/Files/";
        browseable = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "create mask" = "0644";    # Owner RW (6), group R (4), others R (4). This is for Files.
        "directory mask" = "0755"; # Owner RWX (7), group RX (5), others RX (5). This is for Directories
        "force user" = "erik";          # All files created as this user (prevents permission issues)
        "force group" = "users";        # All files created with this group
      };
    }; 
  };
}
