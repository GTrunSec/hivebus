{
  lib,
  config,
  pkgs',
}:
with lib; (mkMerge [
  (mkIf pkgs'.stdenv.isLinux {
    system.stateVersion = config.system.nixos.version;
  })
])
