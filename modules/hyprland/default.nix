{ pkgs, ... }:

{
    # programs.hyprlock.enable = true;
    programs.alacritty.enable = true;
    programs.wofi.enable = true;
    programs.waybar.enable = true;

    wayland.windowManager.hyprland = {
        xwayland.enable = true;
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

            bind = [
                "SUPER,Space,exec,wofi --show run"
                "$MOD,Return,exec,alacritty"
                "$MOD,q,killactive"
                "$MOD,f,fullscreen,0"
                "$MOD,1,workspace,1"
                "$MOD,2,workspace,2"
                "$MODSHIFT,1,movetoworkspace,1"
                "$MODSHIFT,2,movetoworkspace,2"
                "$MOD,Left,resizewindowpixel,20 25%,activewindow"
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
