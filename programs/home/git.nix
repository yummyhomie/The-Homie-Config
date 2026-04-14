{
  programs.git = {
    enable = true;
    settings = {
      user.email = "eleedee@outlook.com";
      user.name = "yummyhomie";
      core.autocrlf = false;  # HATE THIS!!!!
    };
    signing.format = null;  # # This is due to my system stateVersion being older than 25.05
  };
}
