{
  config,
  pkgs,
  lib,
  inputs,
}:
let
  cfg = config.services.chatgpt-next-web;
  nixpkgs = pkgs.appendOverlays [ inputs.nixpkgs-hardenedlinux.overlays.default ];
in
{
  options = with lib; {
    enable = mkEnableOption "chatgpt-next-web";
    port = mkOption {
      type = types.int;
      default = 3000;
      description = "chatgpt-next-web port";
    };
    envFile = mkOption {
      type = types.nullOr types.path;
      default = null;
      description = "chatgpt-next-web env file";
    };
  };

  config = lib.mkIf cfg.enable {
    systemd.services.chatgpt-next-web = {
      description = "chatgpt-next-web";
      wantedBy = [ "network.target" ];
      preStart = ''
        cp -rf --no-preserve=mode,ownership ${nixpkgs.chatgpt-next-web}/* /var/lib/chatgpt-next-web/
        cp -rf --no-preserve=mode,ownership ${nixpkgs.chatgpt-next-web}/.next /var/lib/chatgpt-next-web/.next
        ${lib.optionalString (cfg.envFile != null) ''
          cp -rf ${cfg.envFile} /var/lib/chatgpt-next-web/.env
        ''}
      '';
      script = ''
        export PATH=${
          pkgs.lib.makeBinPath [
            pkgs.nodejs
            pkgs.yarn
            pkgs.bash
          ]
        }:$PATH
        PORT=${toString cfg.port} node server.js
      '';
      serviceConfig = {
        Type = "simple";
        ReadWritePaths = "/var/lib/chatgpt-next-web";
        ProtectSystem = "strict";
        DynamicUser = true;
        Restart = "always";
        WorkingDirectory = "/var/lib/chatgpt-next-web";
        StateDirectory = "chatgpt-next-web";
      };
    };
  };
}
