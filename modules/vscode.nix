{ pkgs, ... }: {
  home.packages = [ pkgs.vscode ];

  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;

    profiles.default = {
      userSettings = {
        "extensions.autoUpdate" = false;
        "extensions.autoCheckUpdates" = false;
        "workbench.sideBar.location" = "right";
        "workbench.iconTheme" = "material-icon-theme";
      };

      extensions =
        with pkgs.vscode-extensions;
        [
          bbenoist.nix
          vscodevim.vim
          pkief.material-icon-theme
          danielgavin.ols
          ziglang.vscode-zig
          rust-lang.rust-analyzer
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
