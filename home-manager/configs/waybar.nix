{
# Waybar 
  programs.waybar = {
    enable = true;
    settings = {
      topBar = {
        layer = "top";
        position = "top";
        height = 16;
        
        modules-left = [ "hyprland/workspaces" ];  
        
        modules-center = [ 
          "clock"
          "network"
          "bluetooth"
          "pulseaudio"
          "battery"
        ];

        modules-right = [  
          "cpu_text"
          "cpu"
          "memory"
          "disk"
          "load"
          "temperature"
        ];

        "hyprland/workspaces" = {
          format = "{icon}";
          "on-click" = "activate";
        }; 

        clock = {
          interval = 01;
          format = "{:%A, %b %d - %I:%M:%S %p}";
        };

        network = {
          format-wifi = "{signalStrength}  {ipaddr}";
          format-ethernet = " {ipaddr}";
          format-disconnected = "";
          on-click = "foot sudo nmtui";
          tooltip-format = "Connected to {essid}\nIP: {ipaddr}\nStrength: {signalStrength}%";
          tooltip-format-ethernet = "IP: {ipaddr}\nInterface: {ifname}";
          tooltip-format-disconnected = "Disconnected";
          interval = 01;
        };

        bluetooth = {
          format =  "";
          on-click = "foot bluetuith"; 
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
          on-click = "foot pulsemixer";
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

        cpu = {
          format = "cpu {usage}%";
          interval = 02;
          "states" = {
            "critical" = 90;
          };
        };

        memory = {
          format = "mem {percentage}%";
          interval = 02;
          "states" = {
            "critical" = 80;
          };
        };
      };
    };

    style = ''
      * {
        border: none;
        padding: 0;
        margin: 0;

        font-family: Trebuchet;
        font-size: 16px;
        font-weight: bold;

        color: #322d28;
      }

      window#waybar { 
        background: transparent;
      }

      .modules-left,
      .modules-center,
      .modules-right { 
        padding: 2px;
      }

      #workspaces button + button { margin-left: 4px; }

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
        margin-left: 4px;
      }
    '';        
  };

  # OG font color: #e2daae; Also cool light color -> #d4be98
  # Background that matches Foot terminal background/opacity rgba(40, 40, 40, 0.9); 
}
