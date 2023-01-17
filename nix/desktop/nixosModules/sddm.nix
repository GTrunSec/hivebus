{
  config,
  lib,
  ...
}: {
  config = with lib;
    mkMerge [
      {
        services.xserver.enable = true;
        services.xserver.displayManager.sddm.enable = true;
      }
      (mkIf config.programs.xwayland.enable {
        services.xserver.displayManager.sddm.enableHidpi = true;
      })
    ];
}
