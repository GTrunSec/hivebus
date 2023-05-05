{
  lib,
  config,
}:
with lib; {
  config = mkIf config.hive.bootstrap (mkMerge [
    (mkIf pkgs.stdenv.isLinux {
      system.stateVersion = config.system.nixos.version;
    })
  ]);
}
