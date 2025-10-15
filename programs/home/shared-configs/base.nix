{
  # Import home-manager modules & configs for all systems here!
  imports = [ 
    ../bash.nix
    ../git.nix
    ../vim.nix
  ];

  # Home-Manager
  programs.home-manager.enable = true;

  home.username = "erik";
  home.homeDirectory = "/home/erik";
  home.stateVersion = "24.11"; # OG Version of NixOS when I joined.

  # Nix Garbage Collect
  nix.gc = {
    automatic = true; # Automatically run nix-garbage-collect at a specific time
    dates = "weekly";
  };

  nixpkgs.config.allowUnfree = true;
}
