{
  pkgs,
  aislop,
  ...
}:

{
  home.packages = [
    pkgs.opencode
    pkgs.bun
  ];

  home.file.".config/opencode/skills".source = "${aislop}/skills";

  programs.opencode = {
    enable = true;
    settings.autoupdate = false;
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
