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
        
        modules-left = [ 
          "hyprland/workspaces" 
        ];  
        modules-center = [ # Work in progress. Want smaller icons, aligned to the left.
          #"cpu"
          #"memory"
          #"disk"
          #"temperature"
        ];
        modules-right = [
          "clock"
          "network"
          "bluetooth"
          "pulseaudio"
          "battery"
        ];

        "hyprland/workspaces" = {
          format = "{icon}";
          "on-click" = "activate";
        }; 

        cpu = {
          interval = 04;
          format = "";
          height = 8;
          #format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
          states = {
            "good" = 10;
            "warning" = 50;
            "critical" = 90;
          };
        };

        memory = {
          interval = 04;
          format = "";
          states = {
            "good" = 10;
            "warning" = 50;
            "critical" = 90;
          };
        };

        disk = {
          interval = 04;
          format = "";
          states = {
            "good" = 10;
            "warning" = 50;
            "critical" = 90;
          };
        };

        temperature = {
          interval = 04;
          format = " {temperatureC}°C";
          states = {
            "good" = 35;
            "warning" = 50;
            "critical" = 60;
          };
        };

        clock = {
          interval = 01;
          format = "{:%A, %b %d - %I:%M:%S %p}";
        };

        network = {
          format-wifi = " {signalStrength}";
          format-ethernet = "";
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
      .modules-center,
      .modules-right {
        /* background: #292828; */
        background: #4a5942;
        border-radius: 4;
      }

      .modules-left {
        padding: 0 8px;
      }

      #workspaces button + button {
        margin-left: 8px;
        background: #4a5942;
      }

      .modules-center {
        background: transparent;
      }

      #cpu,
      #memory {
        margin-right: 16px;
      }

      #cpu.good {
        color: #00ff7f;
      }

      #cpu.warning {
        color: #eed202;
      }

      #cpu.critical {
        color: #ff4500;
      }

      #memory.good {
        color: #00ff7f;
      }

      #memory.warning {
        color: #eed202;
      }

      #memory.critical {
        color: #ff4500;
      }

      #disk.good {
        color: #00ff7f;
      }

      #disk.warning {
        color: #eed202;
      }

      #disk.critical {
        color: #ff4500;
      }

      #temperatureC.good {
        color: #00ff7f;
      }

      #temperatureC.warning {
        color: #eed202;
      }

      #temperatureC.critical {
        color: #ff4500;
      }

      .modules-right {
        padding: 0 16px;
        background: #4a5942;
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
    '';        
  };
}
