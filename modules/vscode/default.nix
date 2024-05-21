{pkgs, ...}: {
  programs.vscode = {
    enable = true;

    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      kamadorueda.alejandra
    ];

    userSettings = {
      editor = {
        fontFamily = "'Cascadia Code', 'JetBrainsMono', 'monospace', monospac";
        fontLigatures = true;
        formatOnSave = true;
      };

      git = {
        confirmSync = false;
        enableSmartCommit = true;
      };
    };
  };
}
