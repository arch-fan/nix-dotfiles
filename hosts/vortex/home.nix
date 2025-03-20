{ pkgs, ... }:
let
  php = pkgs.php82.withExtensions
    ({ enabled, all, }: with all; enabled ++ [ imagick xsl ]);
in {
  imports = [
    ../../modules/git
    ../../modules/vscode
    ../../modules/firefox
    ../../modules/plasma
    ../.
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "vortex";
  home.homeDirectory = "/home/vortex";

  home.packages = with pkgs; [
    discord
    spotify
    jetbrains.phpstorm
    php
    php.packages.composer
    laravel
    btop
    skypeforlinux
    nixfmt-classic
    thunderbird
    lazydocker

    nodejs
    nodePackages.pnpm

    nixd

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    (pkgs.writeShellScriptBin "rebuild" ''
      sudo nixos-rebuild switch --flake ~/nix-dotfiles#vortex
    '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
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

  home.sessionPath = [ "$HOME/.config/composer/vendor/bin/" ];

  home.shellAliases = {
    reload = "home-manager switch --flake ~/dotfiles#vortex";
    dc = "docker compose";
    ls = "lsd";
    l = "ls -la";
    ll = "ls -l";
    tree = "ls --tree";
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/juan/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = { EDITOR = "code"; };

  programs.bash.enable = true;
  programs.lsd.enable = true;
  programs.go.enable = true;
  programs.ghostty.enable = true;
  programs.lazygit.enable = true;

  programs.starship = {
    enable = true;
    settings = {
      format = ''
        [┌─>](bold green) [at](bold blue) $directory$all\\
        [└>](bold green) $username $battery$character'';

      character = {
        success_symbol = "[\\$](bold green)";
        error_symbol = "[\\$](bold red)";
      };

      username = {
        show_always = true;
        format = "[$user]($style)";
      };
    };
  };

  programs.plasma = {
    input.touchpads = [{
      enable = true;
      name = "ELAN0709:00 04F3:30A0 Touchpad";
      vendorId = "04f3";
      productId = "30a0";
      naturalScroll = true;
      pointerSpeed = 0.1;
    }];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
