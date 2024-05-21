{pkgs, ...}: {
  imports = [
    ../.
    ../../modules/git
  ];

  home = {
    username = "juan";
    homeDirectory = "/home/juan";
  };

  programs.bat.enable = true;

  home.packages = with pkgs; [
    nodejs_22
    nodePackages.pnpm
    neovim
    bun
    lsd
  ];
}
