{
  pkgs,
  config,
  lib,
  ...
}:
{
  config =
    with lib;
    mkMerge [
      (mkIf (config.virtualisation.hive.gui && config.virtualisation.libvirtd.enable)
        {
          environment.systemPackages = with pkgs; [
            pkgs.virt-manager
            spice-gtk
          ];
        }
      )
    ];
}
