{
  config,
  lib,
  pkgs,
  ...
}: {
  config = with lib;
    mkMerge [
      {
        home.file.".config/guangtao-sources/acm-terminal".source = pkgs.guangtao-sources.acm-terminal.src;
        home.file.".config/guangtao-sources/plantuml".source = pkgs.plantuml;
      }
      {
        home.packages = [
          (
            pkgs.writeShellScriptBin "node16" ''
              ${lib.getExe pkgs.nodejs-16_x}
            ''
          )
        ];
      }
    ];
}
