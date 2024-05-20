{ ... }:

{
    programs.alacritty.enable = true;
    programs.wofi.enable = true;
    programs.waybar.enable = true;

    wayland.windowManager.hyprland = {
        enable = true;
        xwayland.enable = true;

        settings = {
            monitor= ",preferred,auto,auto";
            MOD = "SUPER";
            exec-once = "waybar &";
            bind = [
                "MOD,SPACE,exec,wofi"
                "MOD,BACKSPACE,exec,alacritty"
            ];
        };
    };
}