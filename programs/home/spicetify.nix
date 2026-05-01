{ inputs, pkgs, ... }:
 let
   spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in
{
   programs.spicetify = {
      enable = true;
   };
}
