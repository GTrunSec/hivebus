{
  inputs,
  cell,
}: {
  bootstrap = [
    inputs.cells.base.darwinModules.nix
  ];
}
