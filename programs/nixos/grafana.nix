{
  # This serves the Grafana frontend. The data/logs collection is setup using
  # data.nix!
  services.grafana = {
    enable = true;
    openFirewall = true;
    settings.server = {
      http_port = 3000;
      http_addr = "0.0.0.0";
    };

    provision.datasources.settings.datasources = [
      {
        name = "The-Homie-Server Data";
        type = "prometheus";
        url = "http://192.168.1.2:9090";
        access = "proxy";
        isDefault = true;
      }
      {
        name = "The-Minecraft-Server Data";
        type = "prometheus";
        url = "http://192.168.1.8:9090";
        access = "proxy";
        isDefault = false;
      }
    ];
  };
}
