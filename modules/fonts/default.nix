{pkgs, ...}: {
  home.packages = with pkgs; [
    cascadia-code
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
  ];
}
