{
  # Import nixos modules & configs for all systems here!
  imports = [ ];

  # Nix Settings
  nix = {
    settings = {
      download-buffer-size = 524288000; # 500 MiB
      auto-optimise-store = true; # This saves disk space by removing identical symlinks from the nix-store
    
      experimental-features = [ "nix-command" "flakes" ]; 
      warn-dirty = false; # Blocks annoying flake warning
    };

    gc = {
      automatic = true; # Automatically run nix-garbage-collect at a specific time
      dates = "weekly";
      options = "--delete-older-than 14d"; # Deletes nixos generations older than 14 days
    };
  };
}
