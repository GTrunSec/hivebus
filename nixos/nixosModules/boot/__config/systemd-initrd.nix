{ config, lib, ... }:
let
  cfg = config.hive.bootstrap;
in
{
  config =
    with lib;
    mkMerge [
      (mkIf cfg.systemd-initrd {
        boot = {
          loader = {
            # timeout = 0;
            efi.canTouchEfiVariables = true;
            # https://discourse.nixos.org/t/configure-grub-on-efi-system/2926/7
            grub = {
              enable = true;
              efiSupport = true;
              device = "nodev";
              useOSProber = true;
            };
          };
          initrd = {
            systemd = {
              enable = true;
              # emergencyAccess = true;
            };
          };
        };
      })
    ];
}
