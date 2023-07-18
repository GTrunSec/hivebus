_: {
  config,
  lib,
  pkgs,
  ...
}: {
  config = with lib;
    mkMerge [
      {
        environment.systemPackages = with pkgs; [
          pciutils
          openssl
          wget
          curl
          unzip
          fd
          ripgrep
          gzip
          nixpkgs-fmt
          clang
          pkg-config
          nrepl
          pngpaste
        ];
      }
    ];
}
