{
  # This runs on docker. Get a NIXPKG up soon!
  virtualisation.docker.enable = true;

  virtualisation.oci-containers.backend = "docker";
  virtualisation.oci-containers.containers.jotty = {
    image = "ghcr.io/fccview/jotty:latest";
    ports = [ "1122:3000" ];
    volumes = [
      "/home/erik/the-homie-jots:/app/data"
      "/var/lib/jotty/config:/app/config"
      "/var/lib/jotty/cache:/app/.next/cache"
    ];
    environment = {
      NODE_ENV = "production";
    };
    extraOptions = [
      "--user=1000:1000"
    ];
  };

  # Create the bind-mount directories when the service starts.
  systemd.services.docker-jotty.preStart = ''
    mkdir -p /home/erik/the-homie-jots
    mkdir -p /var/lib/jotty/config /var/lib/jotty/cache
    chown -R 1000:1000 /home/erik/the-homie-jots /var/lib/jotty
  '';
}
