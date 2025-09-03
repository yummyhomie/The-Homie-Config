{
  # Import home-manager modules for all systems here!
  imports = [ ./home-modules/base-modules/default.nix ];

  home.username = "erik";
  home.homeDirectory = "/home/erik";
  home.stateVersion = "24.11"; # OG Version of NixOS when I joined.

  nixpkgs.config.allowUnfree = true;
  
  programs.home-manager.enable = true;
}
