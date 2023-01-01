{
  inputs,
  cell,
}: let
  inherit (inputs.cells.common.lib) __inputs__;
in {
  imports = [__inputs__.hyprland.homeManagerModules.default];

  wayland.windowManager.hyprland.enable = true;
}
