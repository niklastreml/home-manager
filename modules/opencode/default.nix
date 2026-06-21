{ pkgs, pkgs-unstable, ... }:

{
  home.packages = [ pkgs-unstable.opencode ];

  programs.opencode = {
    enable = true;
    settings.autoupdate = false;
    package = pkgs-unstable.opencode; # Tells the module to use the updated version

    settings.mcp = {
      context7 = {
        type = "remote";
        url = "https://mcp.context7.com/mcp";
      };
      exa = {
        type = "remote";
        url = "https://mcp.exa.ai/mcp";
      };
      morph = {
        type = "local";
        command = [
          "bunx"
          "@morphllm/morphmcp"
        ];
        environment = {
          ENABLED_TOOLS = "warp_grep";
        };
      };
    };

    agents = {
      docs = builtins.readFile ./docs.md;
      review = builtins.readFile ./review.md;
      security-review = builtins.readFile ./security-review.md;
    };

  };
}
