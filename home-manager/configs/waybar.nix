{ 
  programs.waybar = {
    enable = true;
    settings = {
      topBar = {
        layer = "top";
        position = "bottom";
        height = 16;
        
        modules-left = [ 
          "hyprland/workspaces" 
          
          "clock"
          "network"
          "bluetooth"
          "pulseaudio"
          "battery"

          "cpu"
          "memory"
          "disk"
          "temperature"
          
          "image#iris"
          "image#thyme"
        ];  
        
        modules-center = [];

        modules-right = [];

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

        font-family: monospace;
        font-size: 16px;
        font-weight: bold;

        color: #d4be98;
      }

      window#waybar { 
        background: transparent;
      }

      modules-left {
        border: 2px solid #D4BE98;
      }

      #workspaces button + button { margin-left: 4px; }
      
      #workspaces {
        background-color: #32302F;
        padding: 2px;
      }

      #clock,
      #network,
      #bluetooth,
      #pulseaudio,
      #battery {
        background-color: #32302F;
        padding: 2px;
      }

      #bluetooth.connected {
        color: #00bfff;
      }

      #cpu,
      #memory,
      #disk,
      #temperature {
        background-color: #32302F;
        padding: 2px;
      }

      #image {
        background-color: #32302F;
        padding: 2px;
      }
    '';        
  };

  # OG font color: #e2daae; Also cool dark color -> #322d28;
  # Background that matches Foot terminal background/opacity rgba(40, 40, 40, 0.9); 
}
