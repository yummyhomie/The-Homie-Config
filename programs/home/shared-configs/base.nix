{
  # Import home-manager modules & configs for all systems here!
  imports = [ 
    ../bash.nix
    ../git.nix
    ../vim.nix
  ];

  home.username = "erik";
  home.homeDirectory = "/home/erik";
  home.stateVersion = "24.11"; # OG Version of NixOS when I joined.

  nixpkgs.config.allowUnfree = true;
  
  programs.home-manager.enable = true;
}
