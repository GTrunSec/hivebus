{
  inputs,
  cell,
}: {
  desktop = {
    imports = [
      cell.nixosModules.julia
      cell.nixosModules.python
      cell.nixosModules.rust
    ];
  };
}
