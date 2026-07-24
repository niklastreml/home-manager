{
  aislop,
  pkgs,
  lib,
  config,
  ...
}:
{
  options.piMcpServers = lib.mkOption {
    type = (pkgs.formats.json { }).type;
    default = { };
    description = ''
      MCP servers written to {file}`~/.config/mcp/mcp.json` (under the
      `mcpServers` key) for the pi coding agent.
    '';
  };

  config = {
    piMcpServers = {
      context7.url = "https://mcp.context7.com/mcp";
      exa.url = "https://mcp.exa.ai/mcp";
      morph = {
        command = "bunx";
        args = [ "@morphllm/morphmcp" ];
        env.ENABLED_TOOLS = "warp_grep";
      };
      nixos = {
        command = "nix";
        args = [
          "run"
          "github:utensils/mcp-nixos"
          "--"
        ];
      };
    };

    home.file.".pi/agent/skills".source = "${aislop}/skills";
    home.file.".config/mcp/mcp.json".source =
      (pkgs.formats.json { }).generate "mcp.json" {
        mcpServers = config.piMcpServers;
      };
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
  };
}
