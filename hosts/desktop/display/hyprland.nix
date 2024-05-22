{...}: {
  # TEMP
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  # ENDTEMP

  programs.hyprland.enable = true;
}
