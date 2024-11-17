{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../modules/fonts
    ../../modules/kitty
    ../../modules/jetbrains
    ../../modules/git
    ../../modules/vscode
    ../../modules/firefox
    ../.
  ];

  home.username = "juan";
  home.homeDirectory = "/home/juan";

  home.packages = with pkgs; [
    openssh
    obsidian
    spotify
    whatsapp-for-linux

    (pkgs.writeShellScriptBin "rebuild" ''
      sudo nixos-rebuild switch --flake ~/nix-dotfiles#smoker
    '')
  ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR = "code";
  };

  programs.home-manager.enable = true;
}
