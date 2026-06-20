{ ... }:
{
  programs.obsidian.enable = true;
  programs.obsidian.vaults = {
    "notes" = {
            enable = true;
            target = "code/notes";
    };
  };
}
