{
  inputs,
  cell,
}:
{
  default = {
    imports = [
      cell.homeModules.git
    ];
  };
}
// inputs.cells.common.lib.importRakeLeaves ./homeProfiles {inherit inputs cell;}
