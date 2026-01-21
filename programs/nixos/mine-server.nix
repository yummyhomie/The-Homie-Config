{ pkgs, lib, inputs, ... }:
{
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;
    dataDir = "/var/lib/minecraft";
  
    servers = {
      
      The-Homie-Server = {
        enable = true;
        package = pkgs.vanillaServers.vanilla;
      
        serverProperties = {
          gamemode = "survival";
          difficulty = "normal";
          motd = "The-Homie-Server";
          level-name = "The-Homie-Server";
        };
        
        operators = {
          "Yamcakes" = { level = 4; uuid = "c65f0f0a-cfb1-4593-a552-dfc828d348e3"; };
          "YummyHomie" = { level = 1; uuid = "92406a03-9db1-41db-9daa-28d8a2117927"; };
        };
      };
      
      ScaryServer = {
        enable = false;
        package = pkgs.fabricServers.fabric-1_20_1;
      
        serverProperties = {
          gamemode = "survival";
          difficulty = "normal";
          motd = "Scary Ahh Server";
          level-name = "ScaryServerBlud";
          server-port = 1738;

          "voicechat.port" = 24456;
        };

        operators = {
          "YummyHomie" = { level = 4; uuid = "92406a03-9db1-41db-9daa-28d8a2117927"; };
          "TheHeming" = { level = 4; uuid = "7dd488f9-1434-48a2-9ea2-9d0cd7ac593a"; };
        };
        
        symlinks = {
          "mods" = pkgs.linkFarmFromDrvs "mods" (builtins.attrValues {
            
            GeckoLib = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/8BmcQJ2H/versions/Lj5ypG1U/geckolib-fabric-1.20.1-4.7.4.jar"; sha256 = "sha256-YEXkrZ3gSJf6lLaCmr2L1vG/7IwZcprotH6rfbm4nKM="; };

            CaveDweller = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/L5PDxO3G/versions/U9hSycXp/Better%20Cave%20Dweller-1.20.1-fabric.jar"; sha256 = "sha256-OHlTxEinCpiBi/KkPJ8Wzbt2LdpT4FJK1gRgQXwelkY="; };
  
            CaveDwellerEvolved = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/MXnT4UYG/versions/EU89guLn/cave_dweller-1.20.1.jar"; sha256 = "sha256-xaiWmP8aO+ywG/KcXPwagNCYGgHTOQi9Kj1yiW/5Bes="; };

            SpookyDoors = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/j5axkwld/versions/l8IffGWu/spookydoors-fabric-1.20.1-20.1.4.jar"; sha256 = "sha256-fA3uvHwP+F9WGn/YAHdQActpOi4DneCfPxAiqBMjOVI="; };

            # HorrorMessages = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/dxrOAhj5/versions/19hbrXn8/horrormessages-1.0.1-fabric-1.20.1.jar"; sha256 = "sha256-tU8JCMKWFM9g91hwdZ5f3qb3+nadZwn19IToCXX0r0U="; };

            BiomesOPlenty = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/HXF82T3G/versions/eZaag2ca/BiomesOPlenty-fabric-1.20.1-19.0.0.96.jar"; sha256 = "sha256-A4Kp4TNMtzbE8Nhs8NACEG1qmEU6cJlQ678Ok5gx6nI="; };

            # Naturalist = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/F8BQNPWX/versions/dMGBsRgz/naturalist-fabric-4.0.3-1.20.1.jar"; sha256 = "sha256-ohwhBopGu3ZjN2sMzn56ySKKrEbbK8Xz0Tq5tE7TqpI="; };

            # BetterEnd = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/gc8OEnCC/versions/7QwyTILr/better-end-4.0.11.jar"; sha256 = "sha256-KF/u5KJgKsZve02S8NlyrIcq7FE8K2Go9vRHyj3AhCA="; };

            GlitchCore = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/s3dmwKy5/versions/25HLOiOl/GlitchCore-fabric-1.20.1-0.0.1.1.jar"; sha256 = "sha256-+359QjXKv4OVR4vEKu9rv9u++JUd3x9w9zcZ4LJMmcw="; };

            TerraBlender = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/kkmrDlKT/versions/J1S3aA8i/TerraBlender-fabric-1.20.1-3.0.1.10.jar"; sha256 = "sha256-0C2aoszwkSZLD87wdkQSi4I7NCGgK/xAORoBqhzNCiQ="; };

            FabricAPI = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/UapVHwiP/fabric-api-0.92.6%2B1.20.1.jar"; sha256 = "sha256-Ds5QR22jaSERqwS3WUXFRY5w2YzQae78BEqz5Xl33us="; };

            Balm = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/MBAkmtvl/versions/bZcdZaMf/balm-fabric-1.20.1-7.3.34.jar"; sha256 = "sha256-VkUMcRJT9HicIHKzsNB47mOJvb/04r+U/ZYE3wFxmHE="; };

            SimpleVC = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/9eGKb6K1/versions/4DG7BvdF/voicechat-fabric-1.20.1-2.5.35.jar"; sha256 = "sha256-13Yh+5MndkUKY5Ieda08ujJzdlIdWpmrAm1tMNlkWJM="; };
            
            FabricCaveDweller = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/cChd25Tw/versions/qIrI7qcp/cavedweller-1.3.0.jar"; sha256 = "sha256-LCNqUzGBAJUA1iSpWDSV+rf9W6xhS7asGvTgRsAL/KU="; };
            
            OWO = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/ccKDOlHs/versions/zyOBB7J4/owo-lib-0.11.2%2B1.20.jar"; sha256 = "sha256-HCScMNPlC7pcs14MOs6/S9X5ab0zQC3i86amGf1ojRI="; };

            WhatRTheyDoin = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/AtB5mHky/versions/Ub8MHZaV/watut-fabric-1.20.1-1.2.3.jar"; sha256 = "sha256-Hz2pFBylg7G8xwbpgmqnnXiLKwxZICUIxZZSbcEBbmc="; };

            CoroUtl = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/rLLJ1OZM/versions/7tRnsYkP/coroutil-fabric-1.20.1-1.3.7.jar"; sha256 = "sha256-qX1YtEzxzoz0+o/e2cPFdO8d2V5/uwc/hU5/vOnFiLM="; };

            PresenceFootsteps = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/rcTfTZr3/versions/k0t6DSmw/PresenceFootsteps-1.10.1%2B1.20.1.jar"; sha256 = "sha256-cPNU5ezYmTkIYB/N/LTpj3uB9CGSKHKCpbhnEummvpU="; };

            # ManFromTheFog = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/118OmVLd/versions/8hRVUj9Y/TheManFromTheFog-1.1.1%2Bfabric.mc.1.20.1.jar"; sha256 = "sha256-p+V6vIWT/8P01PBV4o+w4mPyT/hJMI+S2fywZegdbV8="; };

            Architectury = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/lhGA9TYQ/versions/WbL7MStR/architectury-9.2.14-fabric.jar"; sha256 = "sha256-vXpwMr7bL/lsaZGoRqRMhXM2pRRCoQX1hZAX6LqdEyE="; };
          });
        };
      };

      EI = {
        enable = false;
        package = pkgs.fabricServers.fabric-1_20_1;
      
        serverProperties = {
          gamemode = "survival";
          difficulty = "normal";
          motd = "Server for E+I (4 ever)";
          level-name = "Office";
          server-port = 4444;
        };
        
        operators = {
          "YummyHomie" = { level = 4; uuid = "92406a03-9db1-41db-9daa-28d8a2117927"; };
          "Yamcakes" = { level = 4; uuid = "c65f0f0a-cfb1-4593-a552-dfc828d348e3"; };
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

      CYSC = {
        enable = true;
        package = pkgs.fabricServers.fabric;

        serverProperties = {
          gamemode = "survival";
          difficulty = "normal";
          motd = "OFFICIAL SERVER FOR CYSCUVU";
          level-name = "627-2";
          max-players = "32";
          #enforce-whitelist = "true";
          server-port = 31337; #leet 
        };
        
        operators = {
          "YummyHomie" = { level = 4; uuid = "92406a03-9db1-41db-9daa-28d8a2117927"; };
        };
        
        symlinks = {
          "mods" = pkgs.linkFarmFromDrvs "mods" (builtins.attrValues {
            SimpleVC = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/9eGKb6K1/versions/1OVXKX2W/voicechat-fabric-1.21.11-2.6.11.jar"; sha256 = "sha256-G1/hX+4GVerQMnYrlaNdB8u+Df0hwl7gtSR6ydG5NTs="; };

            VeryManyPlayers = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/wnEe9KBa/versions/sH60MMGd/vmp-fabric-mc1.21.11-0.2.0%2Bbeta.7.223-all.jar"; sha256 = "sha256-/o3Da0O0L6fyiA+Jnc84uqC4h/N+NT4UzQ2CzjnanHg="; };

            MiniMOTD = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/16vhQOQN/versions/KdNWldBx/minimotd-fabric-mc1.21.11-2.2.2.jar"; sha256 = "sha256-KrT+IGrakLA8nsVbhNPZJom/Zhufd70Fw3TWSaeegKI="; };

            FabricAPI = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/DdVHbeR1/fabric-api-0.141.1%2B1.21.11.jar"; sha256 = "sha256-ald/g72LM8lAQSfRZTGsycQZX0feA5WVfJ1M0J17mMY="; };
          });
        };
      };
    };
  };

  networking.firewall.allowedUDPPorts = [ 24454 24456 1738 31337 ];
}
