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
      #waybar {
        background-color: rgba(54, 1, 63, 0.80);
        color: white;
        border-radius: 999px;
        padding: 4px;
      }

      #clock {
        background-color: #333;
        padding-right: 4px;
      }

      #memory {
        background-color: #09f;
      }
    '';

    settings = {
      mainBar = {
        height = 30;
        layer = "top";
        margin = "4px";
        modules-left = ["hyprland/workspaces" "hyprland/mode"];
        modules-center = ["hyprland/window"];
        modules-right = ["memory" "clock"];

        memory = {
          format = "{used}/{total}";
        };

        clock = {
          format-alt = "{:%a, %d. %b  %H:%M}";
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
