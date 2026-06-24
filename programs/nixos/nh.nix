{
  programs.nh = {
    enable = true;
    flake = "/home/erik/The-Homie-Config";
    clean = {
      enable = true;
      extraArgs = "--keep-since 8d --keep 4";
    };
  };
}
