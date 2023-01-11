{
  inputs,
  cell,
}:
{
  bootstrap.imports =
    [
      cell.lib.nixConfig
    ]
    ++ inputs.cells.bootstrap.darwinSuites.default;
}
// inputs.cells.common.lib.rakeLeaves ./darwinProfiles
