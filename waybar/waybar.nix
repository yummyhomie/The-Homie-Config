{
# Waybar 
  programs.waybar = {
    enable = true;
    settings = {
      topBar = {
        layer = "top";
        position = "top";
        height = 25;
        margin = "4px 4px 0px 4px";
        
        modules-left = [ "hyprland/workspaces" ];  
        modules-right = [
          "clock" 
          # "pulseaudio#microphone"
          "network"
          "pulseaudio"
          "battery"
        ];

        "hyprland/workspaces" = {
          format = "{icon}";
          "on-click" = "activate";
        }; 

        clock = {
          interval = 01;
          format = "{:%A, %b %d - %I:%M:%S %p}";
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "";
          format-icons = {
            default = ["" "" ""];
            headphone = "";
          };
          tooltip-format = "{desc}\nVolume: {volume}%";
          on-click = "pavucontrol";
        };

        network = {
          format-wifi = "";
          format-ethernet = "";
          format-disconnected = "";
          tooltip-format = "Connected to {essid}\nIP: {ipaddr}\nStrength: {signalStrength}%";
          tooltip-format-ethernet = "IP: {ipaddr}\nInterface: {ifname}";
          tooltip-format-disconnected = "Disconnected";
          interval = 30;
        };

        "battery" = {
        "states" = {
            "good" = 95;
            "warning" = 30;
            "critical" = 15;
        };
        "bat" = "BAT1";
        "format" = "{icon} {capacity}%";
        "format-charging" = " {capacity}%";
        "format-plugged" = " {capacity}%";
        "format-discharging" = " {capacity}%";
        "format-alt" = "{icon} {time}";
        "format-icons" = ["" "" "" "" ""];
        }; 
      };
    };
    style = ''
      * {
        border: none;
        border-radius: 0;
        padding: 0;
        margin: 0;
        font-size: 16px;
        font-family: Trebuchet;
        font-weight: bold;
        color: #ffffff;
      }

      window#waybar {
        background: transparent;
      }

      .modules-left,
      .modules-right {
        /* background: #292828; */
        background: #4a5942;
        border-radius: 4;
      }

      .modules-left {
        padding: 0 8px;
      }

      .modules-right {
        padding: 0 16px;
      }

      #pulseaudio {
        margin-left: 16px;
      }

      #network {
        margin-left: 16px;
      }

      #battery {
        margin-left: 16px;
      }
    '';        
  };
}
