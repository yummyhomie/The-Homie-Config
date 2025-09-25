{ config, hostname, ... }:
let
  hwmonPath = 
  if hostname == "the-homie-laptop" then "/sys/class/hwmon/hwmon4/temp1_input"
  else if hostname == "the-homie-machine" then "/sys/class/hwmon/hwmon0/temp1_input"
  else abort "Unknown hostname ${hostname}. Set correct hostname!";
in
{ 
  programs.waybar = {
    enable = true;
    settings = {
      topBar = {
        layer = "top";
        position = "left";
        height = 796;
        
        modules-left = [ 
          # "hyprland/workspaces"
          "niri/workspaces"
          # "cava"
        ];  
        
        modules-center = [
          "clock"
          "clock#clock2"
        ];

        modules-right = [  
          "network"
          "bluetooth"
          "pulseaudio"
          "battery"
          
          "cpu"
          "memory"
          "disk"
          "temperature"
        ];

        "hyprland/workspaces" = {
          format = "{icon}";
          "on-click" = "activate";
        }; 

        cava = {
          "framerate" = 32;
          "autosens" = 2;
          "sensitivity" = 1;
          "bars" = 8;
          "hide_on_silence" = true;
          "stereo" = true;
          "bar_delimiter" = 0;
          "monstercat" = true;
          "waves" = true;
          "format-icons" = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
          "sleep_timer" = 4;
        };

        clock = {
          interval = 60;
          format = "{:%I}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            "mode" = "year";
            "mode-mon-col" = 3;
            "weeks-pos" = "right";
            "format" = {
              "months" = "<span color='#ffead3'><b>{}</b></span>";
              "weeks" = "<span color='#fa6122'><b>W{}</b></span>";
              "weekdays" = "<span color='#ffcc66'><b>{}</b></span>";
              "today" = "<span color='#fa6122'><b><u>{}</u></b></span>";
            };
          };
        };

        "clock#clock2" = {
          interval = 60;
          format = "{:%M}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            "mode" = "year";
            "mode-mon-col" = 3;
            "weeks-pos" = "right";
            "format" = {
              "months" = "<span color='#ffead3'><b>{}</b></span>";
              "weeks" = "<span color='#fa6122'><b>W{}</b></span>";
              "weekdays" = "<span color='#ffcc66'><b>{}</b></span>";
              "today" = "<span color='#fa6122'><b><u>{}</u></b></span>";
            };
          };
        };

        network = {
          format-wifi = "";
          format-ethernet = "";
          format-disconnected = "";
          on-click = "foot sudo nmtui";
          tooltip-format = "Connected to {essid}\nIP: {ipaddr}\nStrength: {signalStrength}%";
          tooltip-format-ethernet = "IP: {ipaddr}\nInterface: {ifname}";
          tooltip-format-disconnected = "Disconnected";
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
          format = "{icon}";
          format-muted = "{icon}";
          format-icons = {
            default = ["" "" "" ""];
            headphone = ["" "" "" ""];
          };
          tooltip-format = "{desc}\nVolume: {volume}%";
          on-click = "foot pulsemixer";
        };

        battery = {
          "states" = {
            "good" = 100;
            "normal" = 98;
            "warning" = 40;
            "critical" = 15;  
          };
          format = "{icon}";
          format-charging = "";
          #"format-plugged" = " {capacity}%";
          #"format-discharging" = " {capacity}%";
          format-alt = "{icon} {time}";
          format-icons = ["" "" "" "" ""];
          tooltip-format = "Battery at {capacity}%";
        };

        cpu = {
          format = "";
          tooltip-format = "CPU Usage: {usage}";
          interval = 02;
          "states" = {
            "good" = 55;
            "warning" = 70;
            "critical" = 85;
          };
        };

        memory = {
          format = "";
          tooltip-format = "Memory Usage: {percentage}%";
          interval = 02;
          "states" = {
            "warning" = 70;
            "critical" = 85;
          };
        };

        disk = {
          format = "";
          tooltip-format = " Disk Free: {free}";
          interval = 30;
          path = "/";
        };

        temperature = {
          format = "{icon}";
          tooltip = true;
          tooltip-format = "Temp: {temperatureC}°C";
          hwmon-path = hwmonPath;
          interval = 2;
          format-icons = ["" "" "" "" ""];
          critical-threshold = 75;
          format-critical = "{icon}";
        };
      };
    };

    style = ''
      * {
        border: none;
        padding: 0px;
        margin: 0px;

        font-family: Trebuchet;
        font-size: 16px;
        font-weight: bold;

        color: #d4be98;
      }

      window#waybar {
        border-radius: 50px;
      }

      #bluetooth.connected {
        color: #00bfff;
      }

      .modules-left {
        margin-top: 4px;
      }

      .module-center {
      }

      .modules-right {
        margin-bottom: 8px;
      }
    
      #clock,
      #clock.clock2 {
        padding-left: 2px;
        padding-right: 2px;
      }

      #network,
      #bluetooth,
      #pulseaudio,
      #battery,
      #cpu,
      #memory,
      #disk {
        padding-bottom: 9px;
      }
      
      #battery.good { color: #A9B665; }
      #battery.normal { color: #D4BE98; }
      #battery.warning { color: #D8A657; }
      #battery.critical { color: #EA6962; }
      
      #cpu.good { color: #A9B665; }
      #cpu.warning { color: #D8A657; }
      #cpu.critical { color: #EA6962; }
      
      #memory.warning { color: #D8A657; }
      #memory.critical { color: #EA6962; }
      
      #temperature.critical { color: #EA6962; }
    '';        
  };

  # OG font color: #e2daae; Also cool dark color -> #322d28;
  # Background that matches Foot terminal background/opacity rgba(40, 40, 40, 0.9); 
}

