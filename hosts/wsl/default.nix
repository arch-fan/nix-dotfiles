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
    rustup
    nodejs_22
    nodePackages_latest.pnpm
    bun
  ];
}
