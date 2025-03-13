{
  pkgs,
  lib,
  ...
}: {
  programs.plasma = {
    workspace = {
      # Should install Nordic manually. Automatice it
      lookAndFeel = "Nordic";
      iconTheme = "Nordic-bluish";
      theme = "Nordic";
      colorScheme = "nordic-bluish";
      windowDecorations.theme = "__aurorae__svg__Nordic";
      windowDecorations.library = "org.kde.kwin.aurorae";
      cursor.theme = "Nordic-cursors";
    };

    krunner.position = "center";

    enable = true;
  };
}
