{
  inputs,
  cell,
}:
{
  guangtao = {
    imports = [
      cell.homeProfiles.doom
      cell.homeModules.packages
    ];
  };
}
// inputs.cells.common.lib.importRakeLeaves ./homeProfiles {inherit cell inputs;}
