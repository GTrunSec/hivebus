{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.programs.wezterm;
in {
  config = with lib;
    mkMerge [
      (mkIf (cfg.enable && nixpkgs.stdenv.isLinux) {
        programs.wezterm = {
          package = pkgs.wezterm;
        };
      })
    ];
}
