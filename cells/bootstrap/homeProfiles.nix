{
  inputs,
  cell,
}:
{
  default = {
    imports = [
      cell.homeModules.git
      cell.homeModules.ssh
    ];
  };
}
// inputs.cells.common.lib.importRakeLeaves ./homeProfiles {inherit inputs cell;}
