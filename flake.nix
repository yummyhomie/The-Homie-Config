{
  description = "The-Homie-Flake! For use across all my beloved machines.";

  inputs = {
    
    nixpkgs = { url = "nixpkgs/nixos-unstable"; };
    
    home-manager = { url = "github:nix-community/home-manager"; inputs.nixpkgs.follows = "nixpkgs"; };
    
    stylix = { url = "github:nix-community/stylix"; inputs.nixpkgs.follows = "nixpkgs"; };

    nix-minecraft = { url = "github:Infinidoge/nix-minecraft"; };
    
    nixcord = { url = "github:kaylorben/nixcord"; inputs.nixpkgs.follows = "nixpkgs"; };

    spicetify-nix = { url = "github:Gerg-L/spicetify-nix"; inputs.nixpkgs.follows = "nixpkgs"; }; 
    
    # firefoxcss = {url = "github:"; flake = false; }; WORK IN PROGRESS. MAKE SURE TO ADD TO OUTPUTS!
  };

  outputs = { nixpkgs, home-manager, stylix, nix-minecraft, nixcord, spicetify-nix, ... }@inputs:

  let

    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};
    
    hostname = "the-homie-laptop";   # Change per system!

    # Determine the type and host based on the hostname.
    type =
      if hostname == "the-homie-laptop" then "machines"
      else if hostname == "the-homie-machine" then "machines"
      else if hostname == "the-homie-server" then "servers"
      else if hostname == "the-hacking-server" then "servers"
      else if hostname == "the-minecraft-server" then "servers"
      else "unknown";

    host =
      if hostname == "the-homie-laptop" then "laptop"
      else if hostname == "the-homie-machine" then "desktop"
      else if hostname == "the-homie-server" then "homelab"
      else if hostname == "the-hacking-server" then "hacking"
      else if hostname == "the-minecraft-server" then "minecraft"
      else "unknown";

    # Put outputs. Determine which system type gets what. (This may get changed to type specific config.)

    # NixOS Modules
    nixModules = {
      desktop = [ stylix.nixosModules.stylix ];
      laptop = [ stylix.nixosModules.stylix ];
      homelab = [];
      hacking = [];
      minecraft = [ nix-minecraft.nixosModules.minecraft-servers ];
    };

    homeModules = {
      desktop = [ 
        stylix.homeModules.stylix 
        nixcord.homeModules.nixcord 
        spicetify-nix.homeManagerModules.spicetify 
      ];
      laptop = [ 
        stylix.homeModules.stylix 
        nixcord.homeModules.nixcord 
        spicetify-nix.homeManagerModules.spicetify 
      ];
      homelab = []; 
      hacking = [];
      minecraft = [];
    };
 
  in 

  {
    nixosConfigurations = {
      ${hostname} = lib.nixosSystem {
        inherit system;
        modules = [
          ./programs/nixos/shared-configs/base.nix        # Import base nixos module for all systems.
          ./programs/nixos/shared-configs/${type}.nix     # Import type specific nixos module. (Servers or Machines)

          ./machines/${host}/config.nix                   # Import host specific nixos module.
          ./machines/${host}/hardware-configuration.nix   # Import host specific hardware module. 

          home-manager.nixosModules.home-manager
          {
            _module.args.hostname = hostname;
            _module.args.type = type;
            _module.args.host = host;
            _module.args.inputs = inputs;                 # Pass inputs to NixOS modules.
          }
        ] ++ nixModules.${host};
      };
    };
    
    homeConfigurations = {
      ${hostname} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./programs/home/shared-configs/base.nix        # Import base home-manager module for all systems.
          ./programs/home/shared-configs/${type}.nix     # Import type specific home-manager module. (Servers or Machines)
          
          ./machines/${host}/home.nix                    # Import host specific home-manager module.
          {
            _module.args.hostname = hostname;
            _module.args.type = type;
            _module.args.host = host;
            _module.args.inputs = inputs;                 # Pass inputs to home-manager modules.
          }
        ] ++ homeModules.${host};
      };
    };
  };
}

