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
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    rustup
    imagemagick
    gcc
    nodejs_22
    pnpm
    nodePackages_latest.vercel
    bun
    openssl_3
    go
    gnumake

    maven
    temurin-bin

    alejandra
    cloudflared
    php83
    php83Packages.composer
    sqlite
    uv
    libgcc
  ];
}
