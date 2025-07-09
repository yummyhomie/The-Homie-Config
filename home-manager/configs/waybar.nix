{ config, ... }:
let
  hostname = builtins.replaceStrings ["\n"] [""] (builtins.readFile "/etc/hostname");

  hwmonPath = 
  if hostname == "the-homie-laptop" then "/sys/class/hwmon/hwmon4/temp1_input"
  else if hostname == "the-homie-machine" then "/sys/class/hwmon/hwmon0/temp1_input"
  else abort "Unknown hostname. Set correct hostname!";
in
{ 
  programs.waybar = {
    enable = true;
    settings = {
      topBar = {
        layer = "bottom";
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
          format-wifi = "{ipaddr}  {signalStrength}";
          format-ethernet = "{ipaddr}  ";
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
          format-muted = "{icon}";
          format-icons = {
            default = ["" "" "" ""];
            headphone = "";
          };
          tooltip-format = "{desc}\nVolume: {volume}%";
          on-click = "foot pulsemixer";
        };

        battery = {
        "states" = {
            "warning" = 40;
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
            "warning" = 70;
            "critical" = 85;
          };
        };

        memory = {
          format = " MEM {percentage}";
          interval = 02;
          "states" = {
            "warning" = 70;
            "critical" = 85;
          };
        };

        disk = {
          format = " DISK {free}";
          interval = 30;
          path = "/";
        };

        temperature = {
          format = "{icon} {temperatureC}°C";
          hwmon-path = hwmonPath;
          interval = 2;
          format-icons = ["" "" "" "" ""];
          "states" = {
            "good" = 45;
            "warning" = 60;
            "critical" = 75;
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

        color: #d4be98;
      }

      window#waybar {
        background: transparent;
      }

      .modules-left {
        background: #32302F;
        border: 2px solid #928374;
        margin-left: 8px;
      }

      #workspaces button + button { margin-left: 4px; }

      #workspaces,
      #clock,
      #network,
      #bluetooth,
      #pulseaudio,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #image { 
        padding: 0px 4px; 
      }
      
      #workspaces { 
        margin: 2px 2px; 
      }

      #clock,
      #network,
      #bluetooth,
      #pulseaudio,
      #battery { 
        margin: 0px 2px; 
      }

      #battery.warning { color: #D8A657; }
      #battery.critical { color: #EA6962; }

      #bluetooth.connected {
        color: #00bfff;
      }

      #cpu,
      #memory,
      #disk,
      #temperature { 
        margin: 0px 2px; 
      }
      
      #cpu.warning { color: #D8A657; }
      #cpu.critical { color: #EA6962; }
      
      #memory.warning { color: #D8A657; }
      #memory.critical { color: #EA6962; }

      #temperature.good { color: #A9B665; }
      #temperature.warning { color: #D8A657; }
      #temperature.critical { color: #EA6962; }

      #image { 
        margin: 0px 2px; 
      }
    '';        
  };

  # OG font color: #e2daae; Also cool dark color -> #322d28;
  # Background that matches Foot terminal background/opacity rgba(40, 40, 40, 0.9); 
}
