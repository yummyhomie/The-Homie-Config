{ hostname, ipAddress, ... }:

let

  ipAddress = 
    if hostname == "the-homie-server" then "192.168.1.2"
    else if hostname == "the-minecraft-server" then "192.168.1.8"
    else "unknown";

in

{
  services.prometheus = {
    enable = true;
    enableReload = true;
    globalConfig = {
      scrape_interval = "1s";
    };

    scrapeConfigs = [
      {
        job_name = "prometheus";
        static_configs = [
          { targets = [ "${ipAddress}:9090" ]; }
        ];
      }
      {
        job_name = "node-exporter";
        static_configs = [
          { targets = [ "${ipAddress}:9100" ]; }
        ];
      }
      {
        job_name = "loki";
        static_configs = [
          { targets = [ "${ipAddress}:3100" ]; }
        ];
      }
      {
        job_name = "promtail";
        static_configs = [
          { targets = [ "${ipAddress}:9080" ]; }
        ];
      }
    ];
  };

   services.prometheus.exporters.node = {
     enable = true;
     enabledCollectors = [ "systemd" ];
    port = 9100;
  };

  services.loki = {
    enable = true;
    configFile = ./loki.yaml;
  };

  services.promtail = {
  enable = true;
  configuration = {
    server = {
      http_listen_port = 9080;
      grpc_listen_port = 0;
    };
    clients = [{
      url = "http://${ipAddress}:3100/loki/api/v1/push";
    }];
    scrape_configs = [{
      job_name = "journal";
      journal = {
        max_age = "12h";
        labels = {
          job = "systemd-journal";
        };
      };
      relabel_configs = [{
        source_labels = [ "__journal__systemd_unit" ];
        target_label = "unit";
      }];
    }
    {
      job_name = "varlogs";
      static_configs = [{
        targets = [ "localhost" ];
        labels = {
          job = "varlogs";
          __path__ = "/var/log/*log";
        };
      }];
    }];
  };
};

  networking.firewall.allowedTCPPorts = [ 9100 9080 9090 3100 ];
}
