{
  inputs,
  cell,
}:
{
  bootstrap.imports =
    [
      cell.lib.nixConfig
    ]
    ++ inputs.cells.base.darwinSuites.default;
}
// inputs.cells.common.lib.rakeLeaves ./darwinProfiles
