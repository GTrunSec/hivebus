_: {
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
      sed -i 's|julia.exe|julia|' $out/langserver/julials.json
      cp ${./nls.json} $out/langserver/nls.json
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
      ${lib.optionalString pkgs.stdenv.isLinux ''
        cc -I. -O2 -Wall -Wextra -fPIC -shared \
        -I${pkgs.enchant2.dev}/include/enchant-2 -lenchant-2 \
        -o jinx-mod.so jinx-mod.c
      ''}
      cp -r * $out
    '';
in {
  config = with lib;
    mkMerge [
      {
        home.file.".config/guangtao-sources/lsp-bridge".source = lsp-bridge;
        home.file.".config/guangtao-sources/acm-terminal".source = pkgs.guangtao-sources.acm-terminal.src;
        home.file.".config/guangtao-sources/plantuml".source = pkgs.plantuml;
      }
      (mkIf pkgs.stdenv.isLinux {
        home.file.".config/guangtao-sources/jinx".source = jinx;
        home.packages = with pkgs; [enchant2];
      })
      {
        home.packages = with pkgs; [
          nodejs_latest
          sqlite
          zeromq
          xclip
          # for copilot
          (
            pkgs.writeShellScriptBin "node16" ''
              ${lib.getExe pkgs.nodejs-16_x} "$@"
            ''
          )
          pkgs.graphviz
          pkgs.ripgrep-all
          (pkgs.symlinkJoin {
            name = "dotsk";
            pathsToLink = ["/lib" "/bin"];
            paths = with pkgs.nodePackages; [
              roughjs
              jsdom
            ];
            buildInputs = [pkgs.makeWrapper];
            postBuild = ''
              makeWrapper ${pkgs.nodejs_latest}/bin/node $out/bin/dotsk \
               --set NODE_PATH $out/lib/node_modules
            '';
          })
        ];
      }
    ];
}
