{ config, hostname, pkgs, ... }:
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
        position = "top";
        
        modules-left = [ 
          "clock"
          
          "network"
          "custom/vpn"
          "bluetooth"
          "pulseaudio"
          "pulseaudio/slider"
          "privacy"
        ];  
        
        modules-center = [ ];

        modules-right = [ 
          "cpu"
          "memory"
          "disk"
          "temperature"
          "battery"
        ];

        clock = {
          interval = 60;
          format = "{:%B %d, %I:%M}";
        };

        network = {
          format-wifi = "";
          format-ethernet = "";
          format-disconnected = "";
          on-click = "kitty sudo nmtui";
          tooltip-format = "Connected to {essid}\nIP: {ipaddr}\nStrength: {signalStrength}%";
          tooltip-format-ethernet = "IP: {ipaddr}\nInterface: {ifname}";
          tooltip-format-disconnected = "Disconnected";
        };
        
        "custom/vpn" = {
          format = "";
          exec = "echo '{\"class\": \"connected\"}'";
          exec-if = "test -d /proc/sys/net/ipv4/conf/airvpn";
          return-type = "json";
          interval = 8;
        };
        
        bluetooth = {
          format =  "";
          on-click = "kitty bluetuith"; 
          format-on = "";
          format-connected = "";
          tooltip-format-connected = "Connected: {device_alias}";
          tooltip-format-disconnected = "Disconnected!";
        };

        pulseaudio = {
          format = "{icon}";
          format-muted = "{icon}";
          format-icons = {
            default = ["" "" "" ""];
            headphone = ["" "" "" ""];
          };
          tooltip-format = "{desc}\nVolume: {volume}%";
          on-click = "kitty pulsemixer";
        };
        
        "pulseaudio/slider" = {
          "min" = 0;
          "max" = 100;
          "orientation" = "horizontal";
        };

        "privacy" = {
          "icon-spacing" = 4;
          "icon-size" = 32;
          "transition-duration" = 250;
          "modules" = [
            {
              "type" = "screenshare";
              "tooltip" = true;
              "tooltip-icon-size" = 24;
            }
            {
              "type" = "audio-out";
              "tooltip" = true;
              "tooltip-icon-size" = 24;
            }
            {
              "type" = "audio-in";
              "tooltip" = true;
              "tooltip-icon-size" = 24;
            }
          ];
          "ignore-monitor" = true;
          "ignore" = [
            {
              "type" = "audio-in";
              "name" = "cava";
            }
            {
              "type" = "screenshare";
              "name" = "obs";
            }
          ];
        };

        cpu = {
          interval = 1;
          format = "";
          tooltip-format = "CPU Usage: {usage}%";
          "states" = {
            "good" = 55;
            "warning" = 70;
            "critical" = 85;
          };
        };
        
        memory = {
          interval = 1;
          format = "";
          tooltip-format = "Memory Usage: {percentage}%";
          "states" = {
            "warning" = 70;
            "critical" = 85;
          };
        };

        disk = {
          interval = 120;
          format = "";
          tooltip-format = " Disk Free: {free}";
          path = "/";
        };

        temperature = {
          interval = 1;
          format = "{icon}";
          tooltip = true;
          tooltip-format = "Temp: {temperatureC}°C";
          hwmon-path = hwmonPath;
          format-icons = ["" "" "" "" ""];
          critical-threshold = 75;
          format-critical = "{icon}";
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

      color: #d0c8c6;
      background-color: transparent;
    }
                                                                                  
/*  ▄█████ ▄▄▄▄   ▄▄▄   ▄▄▄▄ ▄▄ ▄▄  ▄▄  ▄▄▄▄ 
    ▀▀▀▄▄▄ ██▄█▀ ██▀██ ██▀▀▀ ██ ███▄██ ██ ▄▄ 
    █████▀ ██    ██▀██ ▀████ ██ ██ ▀██ ▀███▀  */
                                        
    #clock,
    #custom-vpn,
    #network,
    #bluetooth,
    #pulseaudio,
    #privacy,

    #cpu,
    #memory,
    #disk,
    #temperature,
    #battery {
      padding: 8px;
      margin-left: 1px;
      margin-right: 1px;
    }
                                                                                                                     
/*  ▄████▄ ▄▄  ▄▄ ▄▄ ▄▄   ▄▄  ▄▄▄ ▄▄▄▄▄▄ ▄▄  ▄▄▄  ▄▄  ▄▄  ▄▄▄▄ 
    ██▄▄██ ███▄██ ██ ██▀▄▀██ ██▀██  ██   ██ ██▀██ ███▄██ ███▄▄ 
    ██  ██ ██ ▀██ ██ ██   ██ ██▀██  ██   ██ ▀███▀ ██ ▀██ ▄▄██▀  */                                                      


                                     
/*  ▄█████  ▄▄▄  ▄▄     ▄▄▄  ▄▄▄▄   ▄▄▄▄ 
    ██     ██▀██ ██    ██▀██ ██▄█▄ ███▄▄ 
    ▀█████ ▀███▀ ██▄▄▄ ▀███▀ ██ ██ ▄▄██▀  */                             
      
    #bluetooth.connected { color: #00bfff; }

    #battery.good { color: #D0C8C6; }
    #battery.normal { color: #A9B665; }
    #battery.warning { color: #D8A657; }
    #battery.critical { color: #EA6962; }
    
    #cpu.good { color: #A9B665; }
    #cpu.warning { color: #D8A657; }
    #cpu.critical { color: #EA6962; }
    
    #memory.warning { color: #D8A657; }
    #memory.critical { color: #EA6962; }
    
    #temperature.critical { color: #EA6962; }
                                                           
/*  ██▄  ▄██  ▄▄▄  ▄▄▄▄  ▄▄ ▄▄ ▄▄    ▄▄▄▄▄  ▄▄▄▄ 
    ██ ▀▀ ██ ██▀██ ██▀██ ██ ██ ██    ██▄▄  ███▄▄ 
    ██    ██ ▀███▀ ████▀ ▀███▀ ██▄▄▄ ██▄▄▄ ▄▄██▀  */
      
    #pulseaudio {
      border-right: 0px hidden;
      padding-right: 0;
    }

    #pulseaudio-slider {
      opacity: 0;
      min-width: 0;
      padding: 0;
      margin: 0;
      transition: opacity 0.3s ease, min-width 0.3s ease;
    }

    #pulseaudio-slider:hover {
      opacity: 1;
      min-width: 80px;
      padding: 0 8px;
    }

    #pulseaudio-slider trough {
      min-height: 10px;
      min-width: 0;
      border-radius: 5px;
      background: black;
      transition: min-width 0.3s ease;
    }

    #pulseaudio-slider:hover trough {
      min-width: 80px;
    }

    #pulseaudio-slider slider {
      min-height: 0px;
      min-width: 0px;
      opacity: 0;
      background-image: none;
      border: none;
      box-shadow: none;
    }

    #pulseaudio-slider highlight {
      min-width: 10px;
      border-radius: 4px;
      background: #d0c8c6;
    }

    '';        
  };

  # OG font color: #e2daae; Also cool dark color -> #322d28;
  # Background that matches Foot terminal background/opacity rgba(40, 40, 40, 0.9); 
}
