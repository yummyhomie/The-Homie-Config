{
  services.pihole-ftl = {
    enable = true;
    openFirewallWebserver = true;
    privacyLevel = 0;
  };

  services.pihole-web = {
    enable = true;
    hostName = "pihole.eleedee.net";
    ports = [
      "5436s"
    ];
  };

  networking.firewall.allowedTCPPorts = [ 5436 ];
}
