{
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    guiAddress = "0.0.0.0:8384";
    user = "erik";
    group = "users";
    configDir = "/home/erik/.config/syncthing";
    
    folders = {
      "obsidian" = {
        label = "Obsidian";
        path = "/home/erik/the-homie-vault";
      };
    };
  };
  networking.firewall.allowedTCPPorts = [ 8384 ];
}
