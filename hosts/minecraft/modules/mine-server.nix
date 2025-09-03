{ pkgs, lib, inputs, ... }:
{
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;
  
    servers = {
      cysc-server = {
        enable = true;
        package = pkgs.minecraftServers.paper-1_21_6;

        serverProperties = {
          gamemode = "survival";
          difficulty = "normal";
          motd = "CYSC MC SERVER!!!!";
          level-name = "Iteration 1";
        };
        
        symlinks = {
          "plugins/ViaVersion-5.4.2.jar" = pkgs.fetchurl {
            url = "https://hangarcdn.papermc.io/plugins/ViaVersion/ViaVersion/versions/5.4.2/PAPER/ViaVersion-5.4.2.jar";
            sha256 = "sha256-SIyh3arFK5l/NjPqtaghMVPfcznbZAo1AFjWHQssozM=";
          };
          "plugins/ViaBackwards-5.4.2.jar" = pkgs.fetchurl {
            url = "https://hangarcdn.papermc.io/plugins/ViaVersion/ViaBackwards/versions/5.4.2/PAPER/ViaBackwards-5.4.2.jar";
            sha256 = "sha256-XH2efkPjwUkTEJoiQoHWVUmNEtqH1Xly9dtqF/zlmTo=";
          };
          #"plugins/MiniMOTD.jar" = pkgs.fetchurl {
          #  url = "https://hangarcdn.papermc.io/plugins/jmp/MiniMOTD/versions/2.1.4/PAPER/minimotd-bukkit-2.1.4.jar";
          #  sha256 = "sha256-IWy0lWaDjEWLlSRirZFntbOjjjxnR+Qgq4aNXRTNcgk=";
          #};
        };
      };
    };
  };
}
