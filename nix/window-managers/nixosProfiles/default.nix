{
  inputs,
  cell,
}: {
  hyprland = {
    imports = [
      inputs.cells.common.lib.__inputs__.hyprland.nixosModules.default
      cell.nixosModules.hyprland
    ];
  };
}
