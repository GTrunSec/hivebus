{
  inputs,
  cell,
}: {
  bootstrap = [
    inputs.cells.common.nixosModules.nix
  ];
}
