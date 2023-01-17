{
  config,
  lib,
  pkgs,
  ...
}: let
  lsp-bridge = let
    src = pkgs.guangtao-sources.lsp-bridge.src;
  in
    pkgs.runCommand "lsp-bridge" {} ''
      cp -r ${src} $out && chmod -R +rw $out/*
      sed -i 's|\["rnix-lsp"\]|\["nil"\]|' $out/langserver/rnix-lsp.json
    '';
in {
  config = with lib;
    mkMerge [
      {
        home.file.".config/guangtao-sources/lsp-bridge".source = lsp-bridge;
        home.file.".config/guangtao-sources/acm-terminal".source = pkgs.guangtao-sources.acm-terminal.src;
        home.file.".config/guangtao-sources/plantuml".source = pkgs.plantuml;
      }
      {
        home.packages = with pkgs; [
          nodejs_latest
          sqlite
          libvterm
          (
            pkgs.writeShellScriptBin "node16" ''
              ${lib.getExe pkgs.nodejs-16_x} "$@"
            ''
          )
        ];
      }
    ];
}
