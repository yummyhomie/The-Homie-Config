{ 
  programs.waybar = {
    enable = true;
    settings = {
      topBar = {
        layer = "top";
        position = "top";
        height = 16;
        
        modules-left = [ 
          "image#thyme"
          "hyprland/workspaces" 
        ];  
        
        modules-center = [ 
          "clock"
          "network"
          "bluetooth"
          "pulseaudio"
          "battery"
        ];

        modules-right = [  
          "cpu"
          "memory"
          "disk"
          "temperature"
          "image#iris"
        ];

        "image#iris" = {
          path = "/home/erik/The-Homie-Config/hypr/iris.png";
          size = 16;
          tooltip = false;
        };

        "image#thyme" = {
          path = "/home/erik/The-Homie-Config/hypr/thyme.png";
          size = 16;
          tooltip = false;
        };

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
          format = " CPU {usage}";
          interval = 02;
          "states" = {
            "critical" = 90;
            "warning" = 70;
          };
        };

        memory = {
          format = " MEM {percentage}";
          interval = 02;
          "states" = {
            "critical" = 85;
            "warning" = 70;
          };
        };

        disk = {
          format = " DISK {free}";
          interval = 30;
          path = "/";
        };

        temperature = {
          format = "{icon} {temperatureC}";
          hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
          interval = 2;
          format-icons = ["" "" "" "" ""];
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

      .modules-left { margin-left: 19px; }
      .modules-right { margin-right: 19px; }

      #workspaces button + button { margin-left: 2px; } 

      #network {
        margin-left: 16px;
      }

      #bluetooth.connected {
        color: #00bfff;
      }

      #pulseaudio {
        margin-left: 16px;
      }

      #bluetooth {
        margin-left: 16px;
      }

      #battery {
        margin-left: 16px;
      }

      #cpu {
        margin-left: 16px; 
      }

      #memory {
        margin-left: 16px;
      }

      #disk {
        margin-left: 16px;
      }

      #temperature {
        margin-left: 16px;
        margin-right: 4px;
      }
    '';        
  };

  # OG font color: #e2daae; Also cool light color -> #d4be98
  # Background that matches Foot terminal background/opacity rgba(40, 40, 40, 0.9); 
}
