{ aislop, pkgs, ... }:
{
  home.file.".pi/agent/skills".source = "${aislop}/skills";
  home.file.".config/mcp/mcp.json".source = ./mcp.json;
  # pi-control policy: require approval before git/kubectl commands run.
  home.file.".pi/agent/extensions/pi-controls.jsonc".source = ./pi-controls.jsonc;
  home.sessionVariables.PI_SKIP_VERSION_CHECK = "1";
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
        "npm:@narumitw/pi-goal"
        "npm:@mcowger/pi-control"
      ];
    };
    extraPackages = [
      pkgs.nodejs
      pkgs.bun
      pkgs.clang
      pkgs.python315
      pkgs.uv
    ];
  };
}
