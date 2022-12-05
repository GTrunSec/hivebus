{
  inputs,
  cell,
}: {
  bootstrap.imports = [
    inputs.cells.base.darwinModules.nix
  ];
}
