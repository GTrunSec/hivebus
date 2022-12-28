{
  inputs,
  cell,
}: let
  inherit (inputs.cells.common.lib) __inputs__;
in {
  imports = [__inputs__.hyprland.nixosModules.default];

  programs.hyprland.enable = true;

  services.xserver.displayManager.defaultSession = "hyprland";
}
