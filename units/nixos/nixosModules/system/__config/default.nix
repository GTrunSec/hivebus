{
  lib,
  config,
  pkgs,
  ...
}:
{
  config =
    with lib;
    (mkMerge [
      (mkIf pkgs.stdenv.isLinux {system.stateVersion = config.system.nixos.version;})
    ]);
}
