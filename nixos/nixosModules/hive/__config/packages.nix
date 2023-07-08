{
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
          gnumake
        ];
      })
      (mkIf cfg.full {
        environment.systemPackages = with pkgs; [
          unzip
          gzip

          clang
          nixpkgs-fmt
          pkg-config
          nrepl
          ripgrep
        ];
      })
    ];
}
