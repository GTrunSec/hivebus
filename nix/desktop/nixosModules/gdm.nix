{
  config,
  lib,
  ...
}: {
  config = with lib;
    mkMerge [
      {
        services.xserver.enable = true;
        services.xserver.displayManager.gdm.enable = true;
      }
      (mkIf programs.xwayland.enable {
        services.xserver.displayManager.gdm.wayland = true;
      })
    ];
}
