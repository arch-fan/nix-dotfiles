{ pkgs, ... }: {

  home.packages = with pkgs; [ cascadia-code ];

  programs.vscode = {
    enable = true;

    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      tal7aouy.icons
      ms-azuretools.vscode-docker
    ];

    userSettings = {
      "editor.fontFamily" =
        "'Cascadia Code NF', 'JetBrains Mono', 'monospace', monospac";
      "editor.fontLigatures" = true;
      "editor.formatOnSave" = true;

      "git.confirmSync" = false;
      "git.enableSmartCommit" = true;
      "git.autofetch" = true;

      "nix.formatterPath" = "nixfmt";
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nixd";

      "workbench.iconTheme" = "icons";

      "nix.serverSettings" = {
        "nil" = {
          "formatting" = {
            "command" = [ "nixfmt" ];
            "nix" = {
              "flake" = {
                "autoArchive" = true;
                "autoEvalInputs" = true;
                "nixpkgsInputName" = "nixpkgs";
              };
            };
          };
        };
        "nixd" = {
          "formatting" = { "command" = [ "nixfmt" ]; };
          "options" = {
            "nixpkgs" = {
              "expr" = ''
                import (builtins.getFlake "/home/vortex/nix-dotfiles").inputs.nixpkgs {}'';
            };
            "nixos" = {
              "expr" = ''
                (builtins.getFlake "/home/vortex/nix-dotfiles").nixosConfigurations.vortex.options'';
            };
          };
        };
      };
    };
  };
}
