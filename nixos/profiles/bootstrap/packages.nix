_: {
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.hive.bootstrap;
in {
  config = with lib;
    mkMerge [
      (mkIf (cfg.minimal || cfg.full) {
        environment.systemPackages = with pkgs; [
          pciutils
          openssl
          wget
          curl
        ];
      })
      (mkIf cfg.full {
        environment.systemPackages = with pkgs; [
          unzip
          gzip

          clang
          nixpkgs-fmt
          pkg-config
          cachix
          (
            pkgs.writeShellScriptBin "nrepl" ''
              export PATH=${pkgs.coreutils}/bin:${pkgs.nixUnstable}/bin:$PATH
              if [ -z "$1" ]; then
                 nix repl --argstr host "$HOST" --argstr flakePath "$PRJ_ROOT" ${./nrepl.nix}
               else
                 nix repl --argstr host "$HOST" --argstr flakePath $(readlink -f $1 | sed 's|/flake.nix||') ${./nrepl.nix}
               fi
            ''
          )
        ];
      })
    ];
}
