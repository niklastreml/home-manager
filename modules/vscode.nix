{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    profiles.default = {
      mutableExtensionsDir = false;
      userSettings = {
        "workbench.sideBar.location" = "right";
      };
      extensions =
        with pkgs.vscode-extensions;
        [
          bbenoist.nix
          vscodevim.vim
        ]
        ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "vscode-lldb";
            publisher = "vadimcn";
            version = "1.12.2";
            sha256 = "sha256-cOOClC0uE+Ym10k2T2p/mnTcgqvLVwDH+qo/W7ul3cs=";
          }
          {
            name = "Go";
            publisher = "golang";
            version = "0.54.0";
            sha256 = "sha256-o1SJjR6eQcGWN9BGoN5CBTdn6RsNG2a0+p/ZDcywzr0=";
          }
        ];
    };
  };
}
