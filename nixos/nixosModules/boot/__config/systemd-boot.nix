{ config, lib, ... }:
let
  cfg = config.hive.bootstrap;
in
{
  config =
    with lib;
    mkMerge [
      (mkIf cfg.systemd-boot {
        boot.loader = {
          timeout = 0;
          systemd-boot.enable = true;
          efi.canTouchEfiVariables = true;
        };
      })
    ];
}
