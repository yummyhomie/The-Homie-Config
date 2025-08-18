{
  # Minecraft
  services.minecraft-server = {
    enable = false;
    eula = true;
    openFirewall = false;
    declarative = true;
    serverProperties = {
      difficulty = 2;
      motd = "Minecraft Server!";
    };
  };
}
