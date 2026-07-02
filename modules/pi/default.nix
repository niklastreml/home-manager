{ aislop, pkgs, ... }:
{
  home.file.".pi/agent/skills".source = "${aislop}/skills";
  home.file.".config/mcp/mcp.json".source = ./mcp.json;
  home.sessionVariables.PI_OFFLINE = "1";
  programs.pi-coding-agent = {
    enable = true;
    settings = {
      enableInstallTelemetry = false;
      packages = [
        "npm:context-mode"
        "npm:pi-subagents"
        "npm:pi-mcp-adapter"
        "npm:pi-undo-redo"
        "npm:@plannotator/pi-extension"
      ];
    };
    extraPackages = [
      pkgs.nodejs
      pkgs.bun
      pkgs.python315
    ];

  };
}
