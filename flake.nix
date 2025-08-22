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

  outputs = { self, nixpkgs, home-manager, stylix, ... }@inputs:

  let

    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};

    type = "machines";               # Choose type "Machines" or "Servers."
    host = "laptop";                # Choose desktop, laptop, homelab or hacking.
    hostname = "the-homie-laptop";   # Change per system!

    # Put Outputs here! It's like this to choose per system what has what.
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
          ./${type}/config.nix                            # This'll import modules managed by NixOS.
          ./${type}/${host}/configuration.nix             # This will import host-specific modules.
          ./${type}/${host}/hardware-configuration.nix

          home-manager.nixosModules.home-manager
          {
            _module.args.hostname = hostname;
            _module.args.type = type;
            _module.args.inputs = inputs;                 # Pass inputs to NixOS modules.
          }
        ] ++ nixModules.${host};
      };
    };
    
    homeConfigurations = {
      ${hostname} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./${type}/home.nix                              # This'll import modules managed by home-manager.
          ./${type}/${host}/home.nix                      # This will import host-specific modules.

          {
            _module.args.hostname = hostname;
            _module.args.type = type;
            _module.args.inputs = inputs;                 # Pass inputs to home-manager modules.
          }
        ] ++ homeModules.${host};
      };
    };
  };
}

