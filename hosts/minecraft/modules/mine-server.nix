{ pkgs, lib, inputs, ... }:
{
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;
    dataDir = "/var/lib/minecraft";
  
    servers = {

      cysc-server = {
        enable = false;
        package = pkgs.minecraftServers.paper-1_21_6;

        serverProperties = {
          gamemode = "survival";
          difficulty = "normal";
          motd = "Official Server for the CYSCUVU";
          level-name = "Iteration 2";
          server-port = 25564;
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

      homie-server = {
        enable = false;
        package = pkgs.fabricServers.fabric; # MODLOARD OVERIDE VERSION
      
        serverProperties = {
          gamemode = "survival";
          difficulty = "normal";
          motd = "Official Server 4 da Homies";
          level-name = "Homies-Kissing-Homies-3";
          server-port = 7963;
        };
        
        symlinks = {
          "mods" = pkgs.linkFarmFromDrvs "mods" (builtins.attrValues {
          
            # Backend Compatibility  
            FabricAPI = pkgs.fetchurl { 
              url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/Q8ssLFZp/fabric-api-0.133.0%2B1.21.8.jar"; sha256 = "sha256-qHDQ8kcOL+SOBqmpYtMAyhEsXa0HYP6x65+AgNUbvN0="; };

            ViaPlus = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/rIC2XJV4/versions/FOSYgpkz/ViaFabricPlus-4.2.4.jar"; sha256 = "sha256-cWJoNyOVIp0p2LgAwWwZzmGxqZxRSffDiQZhZ4ynJn8="; };

            ViaFabric = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/YlKdE5VK/versions/17bTjshZ/ViaFabric-0.4.19%2B118-main.jar"; sha256 = "sha256-Ko6fd0gR0fKvD0EH3pp1oBghwjoyaWIQrUTrrhjVbYo="; };

            ViaVersion = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/P1OZGk5p/versions/e4eSuLAu/ViaVersion-5.4.2.jar"; sha256 = "sha256-SIyh3arFK5l/NjPqtaghMVPfcznbZAo1AFjWHQssozM="; };

            ViaBackwards = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/NpvuJQoq/versions/tdyh8oTV/ViaBackwards-5.4.2.jar"; sha256 = "sha256-XH2efkPjwUkTEJoiQoHWVUmNEtqH1Xly9dtqF/zlmTo="; };

            # Mods
            SimpleVoiceChat = pkgs.fetchurl { 
              url = "https://cdn.modrinth.com/data/9eGKb6K1/versions/Z6KdgoP3/voicechat-fabric-1.21.8-2.6.2.jar"; sha256 = "sha256-z75tiiD2/bOaXo2tExce8u9scI6p+1OBVvh6gE45JTU="; };
              
            Herobrine = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/p1WH6sHr/versions/7p2yqbTn/From-The-Fog-Forge-Fabric-1.21.6-1.21.8-v1.10.3.jar"; sha256 = "sha256-VfHW9/4pLPdS30ND66ADKiTz6LSRZM85YPUDSkcKW5Y="; };

            LumenFuch = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/pXWM4MKR/versions/33kBdKie/lumenfuchs-dummy-1.6.1.jar"; sha256 = "sha256-KMEDpvFgbKDLuw3fqZe00Ixz3VvAzBak7aaq97592Do="; };

            BackPacks = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/MGcd6kTf/versions/AsDOMHTa/1.3.4-backpacks_mod-1.21.6-1.21.8.jar"; sha256 = "sha256-4hD7tp1wFAkPKoIHo7rDBdhqJ5zKsiSfC/T23eZw6bU="; };
              
            SpookyDoors = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/j5axkwld/versions/7IAnbo3a/spookydoors-fabric-1.21.8-21.8.1.jar"; sha256 = "sha256-a4abv9S7fBL0v2pumeSPvRTPM/HHT1HROiDZpWey8oI="; };

            BiomesOPlenty = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/HXF82T3G/versions/doFXM86h/BiomesOPlenty-fabric-1.21.8-21.8.0.14.jar"; sha256 = "sha256-dtel1OF+Rg2bm1RS58+N/nZaGdb4IJaCr2WDgI8/4fg="; };

            Gravestones = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/Heh3BbSv/versions/criOSmC6/gravestones-1.1.8%2B1.21.8.jar"; sha256 = "sha256-6hy/rnTRjawWB/1BmEL2bXeO09oYQU6m4sJ/B4Ri91E="; };

            Waystones = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/LOpKHB2A/versions/tg7FAa4Z/waystones-fabric-1.21.8-21.8.3.jar"; sha256 = "sha256-mU13qnLPX+UQVmQRxIzN+izdyAdv04HJl1w42E7jWIg="; };
            
            GlitchCore = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/s3dmwKy5/versions/UF5OQvYS/GlitchCore-fabric-1.21.8-21.8.0.0.jar"; sha256 = "sha256-SAYt8kbAzhDLmU/1yHtK2nwogPM6jfmbyCkOqJhV09I="; };
            
            TerraBlender = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/kkmrDlKT/versions/nIklR4S9/TerraBlender-fabric-1.21.8-6.0.0.3.jar"; sha256 = "sha256-Cu5xVaW2jY5vxGBdjmw/+MTEe431kdjVlF0hBtdTgp8="; };
            
            Pneumocore = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/ZLKQjA7t/versions/D91MQq77/pneumonocore-1.1.20%2B1.21.8.jar"; sha256 = "sha256-/WvbU584Ld/abfBb0iZUfze4eyhC95+lNLb60G+cYcI="; };
            
            Balm = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/MBAkmtvl/versions/NlcJ0pFb/balm-fabric-1.21.8-21.8.5.jar"; sha256 = "sha256-HG74TDUAWv6oyHbau3OZVdCVaz2+Ez39kWplrslGSc4="; };
            
          });
        };
      };
      
      ScaryServer = {
        enable = true;
        package = pkgs.fabricServers.fabric-1_20_1;
      
        serverProperties = {
          gamemode = "survival";
          difficulty = "normal";
          motd = "Scary Ahh Server";
          level-name = "ScaryServer";
          server-port = 1738;
        };
        
        symlinks = {
          "mods" = pkgs.linkFarmFromDrvs "mods" (builtins.attrValues {
            
            GeckoLib = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/8BmcQJ2H/versions/Lj5ypG1U/geckolib-fabric-1.20.1-4.7.4.jar"; sha256 = "sha256-YEXkrZ3gSJf6lLaCmr2L1vG/7IwZcprotH6rfbm4nKM="; };

            CaveDweller = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/L5PDxO3G/versions/U9hSycXp/Better%20Cave%20Dweller-1.20.1-fabric.jar"; sha256 = "sha256-OHlTxEinCpiBi/KkPJ8Wzbt2LdpT4FJK1gRgQXwelkY="; };
  
            CaveDwellerEvolved = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/MXnT4UYG/versions/EU89guLn/cave_dweller-1.20.1.jar"; sha256 = "sha256-xaiWmP8aO+ywG/KcXPwagNCYGgHTOQi9Kj1yiW/5Bes="; };

            SpookyDoors = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/j5axkwld/versions/l8IffGWu/spookydoors-fabric-1.20.1-20.1.4.jar"; sha256 = "sha256-fA3uvHwP+F9WGn/YAHdQActpOi4DneCfPxAiqBMjOVI="; };

            HorrorMessages = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/dxrOAhj5/versions/19hbrXn8/horrormessages-1.0.1-fabric-1.20.1.jar"; sha256 = "sha256-tU8JCMKWFM9g91hwdZ5f3qb3+nadZwn19IToCXX0r0U="; };

            BiomesOPlenty = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/HXF82T3G/versions/eZaag2ca/BiomesOPlenty-fabric-1.20.1-19.0.0.96.jar"; sha256 = "sha256-A4Kp4TNMtzbE8Nhs8NACEG1qmEU6cJlQ678Ok5gx6nI="; };

            Naturalist = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/F8BQNPWX/versions/dMGBsRgz/naturalist-fabric-4.0.3-1.20.1.jar"; sha256 = "sha256-ohwhBopGu3ZjN2sMzn56ySKKrEbbK8Xz0Tq5tE7TqpI="; };

            # BetterEnd = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/gc8OEnCC/versions/7QwyTILr/better-end-4.0.11.jar"; sha256 = "sha256-KF/u5KJgKsZve02S8NlyrIcq7FE8K2Go9vRHyj3AhCA="; };

            GlitchCore = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/s3dmwKy5/versions/25HLOiOl/GlitchCore-fabric-1.20.1-0.0.1.1.jar"; sha256 = "sha256-+359QjXKv4OVR4vEKu9rv9u++JUd3x9w9zcZ4LJMmcw="; };

            TerraBlender = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/kkmrDlKT/versions/J1S3aA8i/TerraBlender-fabric-1.20.1-3.0.1.10.jar"; sha256 = "sha256-0C2aoszwkSZLD87wdkQSi4I7NCGgK/xAORoBqhzNCiQ="; };

            FabricAPI = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/UapVHwiP/fabric-api-0.92.6%2B1.20.1.jar"; sha256 = "sha256-Ds5QR22jaSERqwS3WUXFRY5w2YzQae78BEqz5Xl33us="; };

            Balm = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/MBAkmtvl/versions/bZcdZaMf/balm-fabric-1.20.1-7.3.34.jar"; sha256 = "sha256-VkUMcRJT9HicIHKzsNB47mOJvb/04r+U/ZYE3wFxmHE="; };

            SimpleVC = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/9eGKb6K1/versions/4DG7BvdF/voicechat-fabric-1.20.1-2.5.35.jar"; sha256 = "sha256-13Yh+5MndkUKY5Ieda08ujJzdlIdWpmrAm1tMNlkWJM="; };
            
            FabricCaveDweller = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/cChd25Tw/versions/qIrI7qcp/cavedweller-1.3.0.jar"; sha256 = "sha256-LCNqUzGBAJUA1iSpWDSV+rf9W6xhS7asGvTgRsAL/KU="; };
            
            OWO = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/ccKDOlHs/versions/zyOBB7J4/owo-lib-0.11.2%2B1.20.jar"; sha256 = "sha256-HCScMNPlC7pcs14MOs6/S9X5ab0zQC3i86amGf1ojRI="; };
          });
        };
      };

      EI = {
        enable = true;
        package = pkgs.fabricServers.fabric-1_20_1;
      
        serverProperties = {
          gamemode = "survival";
          difficulty = "normal";
          motd = "Server for E+I (4 ever)";
          level-name = "Office";
          server-port = 4444;
        };
        
        symlinks = {
          "mods" = pkgs.linkFarmFromDrvs "mods" (builtins.attrValues {
            
            GeckoLib = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/8BmcQJ2H/versions/Lj5ypG1U/geckolib-fabric-1.20.1-4.7.4.jar"; sha256 = "sha256-YEXkrZ3gSJf6lLaCmr2L1vG/7IwZcprotH6rfbm4nKM="; };

            BiomesOPlenty = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/HXF82T3G/versions/eZaag2ca/BiomesOPlenty-fabric-1.20.1-19.0.0.96.jar"; sha256 = "sha256-A4Kp4TNMtzbE8Nhs8NACEG1qmEU6cJlQ678Ok5gx6nI="; };

            Naturalist = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/F8BQNPWX/versions/dMGBsRgz/naturalist-fabric-4.0.3-1.20.1.jar"; sha256 = "sha256-ohwhBopGu3ZjN2sMzn56ySKKrEbbK8Xz0Tq5tE7TqpI="; };

            GlitchCore = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/s3dmwKy5/versions/25HLOiOl/GlitchCore-fabric-1.20.1-0.0.1.1.jar"; sha256 = "sha256-+359QjXKv4OVR4vEKu9rv9u++JUd3x9w9zcZ4LJMmcw="; };

            TerraBlender = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/kkmrDlKT/versions/J1S3aA8i/TerraBlender-fabric-1.20.1-3.0.1.10.jar"; sha256 = "sha256-0C2aoszwkSZLD87wdkQSi4I7NCGgK/xAORoBqhzNCiQ="; };

            FabricAPI = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/UapVHwiP/fabric-api-0.92.6%2B1.20.1.jar"; sha256 = "sha256-Ds5QR22jaSERqwS3WUXFRY5w2YzQae78BEqz5Xl33us="; };
            
            FarmersDelight = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/7vxePowz/versions/PB4pwRax/FarmersDelight-1.20.1-2.4.0%2Brefabricated.jar"; sha256 = "sha256-u/1f3llGpqSP6C6SwbUKkKNF7yVN8prUJlsJ4eLBVFA="; };
          });
        };
      };
    };
  };

  networking.firewall.allowedUDPPorts = [ 4444 25564 7963 24454 8888 ];
}
