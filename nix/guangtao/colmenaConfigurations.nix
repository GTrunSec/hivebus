{
  inputs,
  cell,
}: let
  inherit (inputs) nixos;
  inherit (inputs.cells) _QUEEN;

  l = inputs.nixpkgs.lib // builtins;
in {
  desktop = {
    inherit (cell.nixosConfigurations.desktop) bee imports;
  };
}
