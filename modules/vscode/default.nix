{ pkgs, ... }: {
  programs.vscode = {
    enable = true;

    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      tal7aouy.icons
    ];

    userSettings = {
      "editor.fontFamily" =
        "'Cascadia Code', 'JetBrains Mono', 'monospace', monospac";
      "editor.fontLigatures" = true;
      "editor.formatOnSave" = true;

      "git.confirmSync" = false;
      "git.enableSmartCommit" = true;
      "git.autofetch" = true;

      "nix.formatterPath" = "nixfmt";
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";

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
      };
    };
  };
}
