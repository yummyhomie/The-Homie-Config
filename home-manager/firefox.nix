{
# Firefox
  programs.firefox = {
    enable = true;
    policies = {
      DefaultDownloadDirectory = "/home/erik/Downloads/";
    };
    profiles = {
      default = {
        search = {
          force = true;
          default = "DuckDuckGo";
        };
        settings = {};
      };
    };
  };
}