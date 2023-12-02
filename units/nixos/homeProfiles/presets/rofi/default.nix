_:
{
  config,
  pkgs,
  lib,
  ...
}:
{
  home.packages =
    with pkgs;
    (lib.optionals
      (
        config.wayland.windowManager.hyprland.enable
        || config.wayland.windowManager.sway.enable
      )
      [rofi-wayland]
    );
}
