{
  description = "The-Homie-Flake! For use with the-homie-laptop and the-homie-machine.";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:nix-community/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, stylix, ... }@inputs:
  let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};
  in 

  {
    nixosConfigurations = {

      # The-Homie-Machine
      the-homie-machine = lib.nixosSystem {
        inherit system;
        modules = [
          ./nixos/configuration.nix
          home-manager.nixosModules.home-manager

          stylix.nixosModules.stylix
        ];
      };

      # The-Homie-Laptop
      the-homie-laptop = lib.nixosSystem {
        inherit system;
        modules = [
          ./nixos/configuration.nix
          home-manager.nixosModules.home-manager
          
          stylix.nixosModules.stylix
        ];
      };
    };
    
    homeConfigurations = {
      "the-homie-machine" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home-manager/home.nix
          stylix.homeModules.stylix
          {
            _module.args.hostname = "the-homie-machine";
          }
        ];
      };
      "the-homie-laptop" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home-manager/home.nix
          stylix.homeModules.stylix
          {
            _module.args.hostname = "the-homie-laptop";
          }
        ];
      };
    };
  };
}

