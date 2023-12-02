{
  config,
  lib,
  pkgs,
  ...
}:
let
  jinx =
    let
      src = pkgs.guangtao-sources.jinx.src;
    in
    pkgs.runCommand "jinx"
      {
        buildInputs = with pkgs; [
          (config.programs.emacs.package or pkgs.emacs)
          enchant2
          gcc
        ];
      }
      ''
        mkdir -p $out
        cp -r ${src}/* .
        ${lib.optionalString pkgs.stdenv.isLinux ''
          cc -I. -O2 -Wall -Wextra -fPIC -shared \
          -I${pkgs.enchant2.dev}/include/enchant-2 -lenchant-2 \
          -o jinx-mod.so jinx-mod.c
        ''}
        cp -r * $out
      '';
in
{
  config =
    with lib;
    mkMerge [
      {home.file.".config/guangtao-sources/plantuml".source = pkgs.plantuml;}
      (mkIf pkgs.stdenv.isLinux {
        # home.file.".config/guangtao-sources/jinx".source = jinx;
        home.packages = with pkgs; [enchant2];
      })
      {
        home.packages = with pkgs; [
          nodejs_latest
          sqlite
          zeromq
          xclip
          pngpaste
          # for copilot
          # (pkgs.writeShellScriptBin "node16" ''
          #   ${lib.getExe pkgs.nodejs-16_x} "$@"
          # '')
          pkgs.graphviz
          # pkgs.ripgrep-all
          (pkgs.symlinkJoin {
            name = "dotsk";
            pathsToLink = [
              "/lib"
              "/bin"
            ];
            paths =
              with pkgs.nodePackages;
              [
                # roughjs
                # jsdom
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
