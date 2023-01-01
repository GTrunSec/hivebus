{
  inputs,
  cell,
}: let
  inherit (inputs.cells.common.lib) __inputs__;
in {
  hyprland = {
    imports = [
      __inputs__.hyprland.nixosModules.default
      cell.nixosModules.hyprland
    ];
    services.xserver.displayManager.sessionPackages = [__inputs__.hyprland.packages.default];
  };
}
