{
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    guiAddress = "127.0.0.1:8384";  # Localhost Only
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
}
