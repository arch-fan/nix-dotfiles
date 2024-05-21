{
  pkgs,
  lib,
  ...
}: {
  # programs.hyprlock.enable = true;
  programs.alacritty.enable = true;

  programs.wofi = {
    enable = true;

    settings = {
      hide_scroll = true;
      show = "drun";
      width = "30%";
      lines = 8;
      line_wrap = "word";
      term = "bash";
      allow_markup = true;
      always_parse_args = false;
      show_all = true;
      print_command = true;
      layer = "overlay";
      allow_images = true;
      sort_order = "alphabetical";
      gtk_dark = true;
      prompt = "";
      image_size = 20;
      display_generic = false;
      location = "center";
      key_expand = "Tab";
      insensitive = false;
    };

    style = ''
      * {
        font-family: JetBrainsMono;
        color: #e5e9f0;
        background: transparent;
      }

      #window {
        background: rgba(41, 46, 66, 0.5);
        margin: auto;
        padding: 10px;
        border-radius: 20px;
        border: 5px solid #b072d1;
      }

      #input {
        padding: 10px;
        margin-bottom: 10px;
        border-radius: 15px;
      }

      #outer-box {
        padding: 20px;
      }

      #img {
        margin-right: 6px;
      }

      #entry {
        padding: 10px;
        border-radius: 15px;
      }

      #entry:selected {
        background-color: #2e3440;
      }

      #text {
        margin: 2px;
      }
    '';
  };

  programs.waybar = {
    enable = true;

    style = ''
      * {
        font-family: JetBrains Mono Nerd Font;
        font-size: 12px;
        font-weight: 800;
        margin: 0;
      }

      window#waybar {
        background: rgba(0,0,0,0);
        color: white;
        transition-property: background-color;
        transition-duration: 0.5s;
        border-radius: 0px;
        margin: 0px;
      }

      window#waybar.hidden {
          opacity: 0.2;
      }

      tooltip {
        background: rgba(30, 30, 30, 0.9);
        border: 2px solid rgba(133, 102, 143, 0.9);
      }

      #workspaces button {
        padding: 0 0px;
        color: #7984a4;
        padding: 0 5 0 5;
        background-color: transparent;
        /* Use box-shadow instead of border so the text isn't offset */
        box-shadow: inset 0 -3px transparent;
        /* Avoid rounded borders under each workspace name */
        border: none;
        border-radius: 0;
      }

      #workspaces button.focused {
        background-color: transparent;
      }
      #workspace button.hover {
        background-color: transparent;
      }
      #workspaces button.active {
        color: #fff;
      }

      #workspaces button.urgent {
        background-color: #eb4d4b;
      }

      #custom-wheater,
      #custom-updates,
      #tray,
      #workspaces,
      #clock,
      #clock.date,
      #network,
      #pulseaudio,
      #battery,
      #backlight
      #window,

      #workspaces {
        border-radius: 10px;
        padding: 0px 10px;
        background-color: #1e1e2e;
        margin: 10px;
      }

      #custom-wheater {
        color: #7984a4;
        background-color: #1e1e2e;
        padding: 0px 10px;
        margin: 10px;
      }
      #custom-updates {
        background-color: #1e1e2e;
        color: #7984a4;
        padding: 0px 10px;
        margin: 10px;
      }

      #tray {
        color: #7984a4;
        margin: 10px;
        background-color: #1e1e2e;
      }

      #workspaces {
        color: #7984a4;
        background-color: #1e1e2e;
        padding: 0px 10px;
        margin: 10px;
      }

      #clock {
        color: #7984a4;
        background-color: #1e1e2e;
        padding: 0px 10px;
        margin: 10px;
      }

      #memory {
        color: #7984a4;
        background-color: #1e1e2e;
        padding: 0px 10px;
        margin: 10px;
        border-radius: 10px;
      }

      #cpu {
        color: #7984a4;
        background-color: #1e1e2e;
        padding: 0px 10px;
        margin: 10px;
        border-radius: 10px;
      }

      #clock.date {
        color: #7984a4;
        background-color: #1e1e2e;
        padding: 0px 10px;
        margin: 10px;
      }

      #network {
        color: #7984a4;
        background-color: #1e1e2e;
        padding: 0px 10px;
        margin: 10px;
      }

      #pulseaudio {
        color: #7984a4;
        background-color: #1e1e2e;
        padding: 0px 10px;
        margin: 10px;
      }

      #battery{
        color: #7984a4;
        background-color: #1e1e2e;
        padding: 0px 10px;
        margin: 10px;
      }

      #backlight{
        color: #7984a4;
        background-color: #1e1e2e;
        padding: 0px 10px;
        margin: 10px;
      }
    '';

    settings = {
      mainBar = {
        layer = "top";
        modules-left = ["hyprland/workspaces" "hyprland/mode"];
        modules-center = ["hyprland/window"];
        modules-right = ["cpu" "memory" "clock"];

        cpu = {
          interval = 5;
          format = "{usage}% ";
        };

        memory = {
          interval = 5;
          format = "{used}G/{total}G ";
        };

        clock = {
          format = "{:%H:%M} ";
          format-alt = "{:%a, %d. %b  %H:%M} ";
        };
      };
    };
  };

  wayland.windowManager.hyprland = {
    # xwayland.enable = true;
    enable = true;

    settings = {
      "$MOD" = "SUPER";

      env = [
        "WLR_NO_HARDWARE_CURSORS,1"
      ];

      monitor = ",preferred,auto,auto";

      exec-once = [
        "waybar &"
        "hyprctl setcursor Bibata-Modern-Classic 24"
      ];

      input = {
        kb_layout = "es";
      };

      bind = lib.concatLists [
        [
          "SUPER,Space,exec,wofi --show run"
          "$MOD,Return,exec,alacritty"
          "$MOD,q,killactive"
          "$MOD,f,fullscreen,0"
          "$MOD,Left,resizewindowpixel,25%,activewindow"
        ]
        (lib.concatMap (i: [
          "$MOD,${toString i},workspace,${toString i}"
          "$MODSHIFT,${toString i},movetoworkspace,${toString i}"
        ]) (lib.range 1 6))
      ];

      decoration = {
        rounding = 5;
      };

      general = {
        gaps_in = 4;
        gaps_out = 8;
      };
    };
  };
}
