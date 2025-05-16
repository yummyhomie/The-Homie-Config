{
# Waybar 
  programs.waybar = {
    enable = true;
    settings = {
      topBar = {
        layer = "top";
        position = "top";
        height = 25;
        margin = "8px 21px -13px 21px";
        
        modules-left = [ "hyprland/workspaces" ];  
        modules-center = [ 
          "clock"
          "network"
          "bluetooth"
          "pulseaudio"
          "battery"
        ];
        modules-right = [ "wlr/taskbar" ];

        "hyprland/workspaces" = {
          format = "{icon}";
          "on-click" = "activate";
        }; 

        clock = {
          interval = 01;
          format = "{:%A, %b %d - %I:%M:%S %p}";
        };

        network = {
          format-wifi = " {signalStrength} {ipaddr}";
          format-ethernet = " {ipaddr}";
          format-disconnected = "";
          on-click = "gnome-terminal -e sudo nmtui";
          tooltip-format = "Connected to {essid}\nIP: {ipaddr}\nStrength: {signalStrength}%";
          tooltip-format-ethernet = "IP: {ipaddr}\nInterface: {ifname}";
          tooltip-format-disconnected = "Disconnected";
          interval = 01;
        };

        bluetooth = {
          format =  "";
          on-click = "gnome-terminal -e bluetuith"; 
	        # "controller": "controller1" # This specifies the alias of the controller to use if there are more than 1 on the system
          format-disabled = "";
          format-connected = "";
          #tooltip-format = "{controller_alias}\t{controller_address}";
          tooltip-format-connected = "Connected:\n{device_alias}";
          tooltip-format-disconnected = "Disconnected!";
        };

        pulseaudio = {
          format = "{icon} {volume}";
          format-muted = "";
          format-icons = {
            default = ["" "" ""];
            headphone = "";
          };
          tooltip-format = "{desc}\nVolume: {volume}%";
          on-click = "gnome-terminal -e pulsemixer";
        };

        battery = {
        "states" = {
            "good" = 95;
            "warning" = 30;
            "critical" = 15;
        };
        format = "{icon} {capacity}%";
        format-charging = " {capacity}%";
        #"format-plugged" = " {capacity}%";
        #"format-discharging" = " {capacity}%";
        format-alt = "{icon} {time}";
        format-icons = ["" "" "" "" ""];
        }; 

        "wlr/taskbar" = {
          format = "{icon}";
          "on-click" = "activate";
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
        color: #e2daae;
      }

      window#waybar {
        background: transparent;
      }

      .modules-left,
      .modules-center,
      .modules-right {
        background: transparent;

        /* background: #292828; */
        /* background: #4a5942; */
        /* background: #282524; */
        border-radius: 0; /* Used to be 4 */
      }

      #workspaces button + button {
        margin-left: 8px;
      }

      #workspaces button {
        color: #e2daae;
      }

      #bluetooth.connected {
        color: #00bfff;
      }

      #pulseaudio {
        margin-left: 16px;
      }

      #network {
        margin-left: 16px;
      }

      #bluetooth {
        margin-left: 16px;
      }

      #battery {
        margin-left: 16px;
      }

      #taskbar button + button {
        margin-left: 8px;
      }
    '';        
  };
}
