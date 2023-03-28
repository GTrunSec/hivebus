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
      cp ${./nls.json} $out/langserver/nls.json
      cp ${./julia.json} $out/langserver/julia.json
    '';
  jinx = let
    src = pkgs.guangtao-sources.jinx.src;
  in
    pkgs.runCommand "jinx" {
      buildInputs = with pkgs; [
        (config.programs.emacs.package or pkgs.emacs)
        enchant2
        gcc
      ];
    } ''
      mkdir -p $out
      cp -r ${src}/* .
      cc -I. -O2 -Wall -Wextra -fPIC -shared \
      -I${pkgs.enchant2.dev}/include/enchant-2 -lenchant-2 \
      ${if pkgs.stdenv.isDarwin then "-o jinx-mod.dylib jinx-mod.c"
      else "-o jinx-mod.so jinx-mod.c"}
      cp -r * $out
    '';
in {
  config = with lib;
    mkMerge [
      {
        home.file.".config/guangtao-sources/lsp-bridge".source = lsp-bridge;
        home.file.".config/guangtao-sources/jinx".source = jinx;
        home.file.".config/guangtao-sources/acm-terminal".source = pkgs.guangtao-sources.acm-terminal.src;
        home.file.".config/guangtao-sources/plantuml".source = pkgs.plantuml;
      }
      {
        home.packages = with pkgs; [
          nodejs_latest
          sqlite
          zeromq
          xclip
          enchant2
          # for copilot
          (
            pkgs.writeShellScriptBin "node16" ''
              ${lib.getExe pkgs.nodejs-16_x} "$@"
            ''
          )
        ];
      }
    ];
}
