{
  pkgs,
  lib,
  ...
}: {
  # programs.hyprlock.enable = true;
  programs.alacritty.enable = true;
  programs.wofi.enable = true;
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
        modules-right = ["memory" "clock"];

        memory = {
          format = "{used}/{total}󰍛";
        };

        clock = {
          format-alt = "{:%a, %d. %b  %H:%M}";
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
