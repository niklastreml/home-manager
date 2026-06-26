{ aislop, pkgs, ... }:
{
  home.file.".pi/agent/skills".source = "${aislop}/skills";
  home.file.".config/mcp/mcp.json".source = ./mcp.json;
  home.sessionVariables.PI_OFFLINE = "1";
  programs.pi-coding-agent = {
    enable = true;
    settings = {
      enableInstallTelemetry = false;
      defaultProvider = "github-copilot";
      defaultThinkingLevel = "medium";
      defaultModel = "claude-opus-4.8";
      packages = [
        "npm:context-mode"
        "npm:pi-subagents"
        "npm:@plannotator/pi-extension"
        "npm:pi-mcp-adapter"
      ];
    };
    extraPackages = [
      pkgs.nodejs
      pkgs.bun
      pkgs.python315
    ];

  };
}
