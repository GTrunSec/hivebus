{
  inputs,
  cell,
}: {
  bootstrap = [
    inputs.cells.base.nixosModules.nix
  ];
}
