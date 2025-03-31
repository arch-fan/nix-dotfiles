{ pkgs, ... }: {

  home.packages = with pkgs; [ cascadia-code ];

  programs.vscode = {
    enable = true;

    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      file-icons.file-icons
      ms-azuretools.vscode-docker
      gitlab.gitlab-workflow
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
          "nixpkgs" = {
            "expr" = ''
              import (builtins.getFlake "/home/vortex/nix-dotfiles").inputs.nixpkgs {
                config = { allowUnfree = true; };
              }
            '';
          };
          "options" = {
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
