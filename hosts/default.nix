{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    lsd
    htop
    neovim
    alejandra
  ];
}
