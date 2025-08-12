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
    hostname = "the-homie-${host}";
    host = "machine"; # Declare this manually!
  in 

  {
    nixosConfigurations = {
      ${hostname} = lib.nixosSystem {
        inherit system;
        modules = [
          ./nixos/configuration.nix
          ./nixos/${host}/configuration.nix
          ./nixos/${host}/hardware-configuration.nix
          home-manager.nixosModules.home-manager

          stylix.nixosModules.stylix
          {
            _module.args.hostname = hostname;
          }
        ];
      };
    };
    
    homeConfigurations = {
      ${hostname} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home/home.nix

          stylix.homeModules.stylix
          {
            _module.args.hostname = hostname;
          }
        ];
      };
    };
  };
}

