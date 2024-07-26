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
    rustc
    cargo
    nodejs_22
    nodePackages_latest.pnpm
    bun
    alejandra
    cloudflared
    php83
    php83Packages.composer
    sqlite
  ];
}
