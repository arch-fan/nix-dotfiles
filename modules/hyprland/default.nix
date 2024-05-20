{ ... }:

{
    programs.wofi.enable = true;
    programs.waybar.enable = true;

    wayland.windowManager.hyprland = {
        enable = true;
        xwayland.enable = true;
        enableNvidiaPatches = true;

        settings = {
            MOD = "SUPER";
            exec-once = "waybar &";
            bind = "MOD, SPACE, wofi";
        };
    };
}