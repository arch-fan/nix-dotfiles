{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    extensions = [
      pkgs.vscode-extensions.bbenoist.nix
    ];

    userSettings = {
        editor.fontFamily = "'Cascadia Code', 'JetBrainsMono', 'monospace', monospac";
        editor.fontLigatures = true;
        editor.formatOnSave = true;
        git.confirmSync = false;
    };
  };
}