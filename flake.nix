{
  description = "The-Homie-Flake! For use across all my beloved machines.";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:nix-community/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
    
    # firefoxcss = {url = "github:"; flake = false; }; WORK IN PROGRESS. MAKE SURE TO ADD TO OUTPUTS!
  };

  outputs = { nixpkgs, home-manager, stylix, ... }@inputs:

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
      else "unknown";

    host =
      if hostname == "the-homie-laptop" then "laptop"
      else if hostname == "the-homie-machine" then "desktop"
      else if hostname == "the-homie-server" then "homelab"
      else if hostname == "the-hacking-server" then "hacking"
      else "unknown";

    # Put outputs. Determine which system type gets what. (This may get changed to type specific config.) 
    nixModules = {
      desktop = [ stylix.nixosModules.stylix ];
      laptop = [ stylix.nixosModules.stylix ];
      
      homelab = [];
      hacking = [];
    };

    homeModules = {
      desktop = [ stylix.homeModules.stylix ];
      laptop = [ stylix.homeModules.stylix ];
      
      homelab = []; 
      hacking = [];
    };
 
  in 

  {
    nixosConfigurations = {
      ${hostname} = lib.nixosSystem {
        inherit system;
        modules = [
          ./modules/nixos-base.nix                        # Import base nixos module for all systems.
          ./modules/nixos-${type}.nix                     # Import type specific nixos module.

          ./hosts/${host}/config.nix                      # Import host specific nixos module.
          ./hosts/${host}/hardware-configuration.nix      # Import host specific hardware module. 

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
          ./modules/home-base.nix                         # Import base home-manager modules for all systems.
          ./modules/home-${type}.nix                      # Import type specific home-manager module.

          ./hosts/${host}/home.nix                        # Import host specific home-manager module.
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

