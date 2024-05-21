{pkgs, ...}: {
  programs.vscode = {
    enable = true;

    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      kamadorueda.alejandra
    ];

    userSettings = {
      editor.fontFamily = "'Cascadia Code', 'JetBrainsMono', 'monospace', monospac";
      editor.fontLigatures = true;
      editor.formatOnSave = true;
      git.confirmSync = false;
    };
  };
}
