{
  # Import home-manager modules & configs for all systems here!
  imports = [ 
    ../bash.nix
    ../git.nix
    ../vim.nix
  ];

  # Home-Manager
  programs.home-manager.enable = true;

  # Home-Manager User
  home.username = "erik";
  home.homeDirectory = "/home/erik";
  home.stateVersion = "24.05"; # OG Version of NixOS when I joined.

  nixpkgs.config.allowUnfree = true;
}
