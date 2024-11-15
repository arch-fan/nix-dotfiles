{pkgs, ...}: {
  home.packages = with pkgs.jetbrains; [
    datagrip
    idea-ultimate
    pycharm-professional
  ];
}
