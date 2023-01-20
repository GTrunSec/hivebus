{
  inputs,
  cell,
}:
inputs.cells.common.lib.importRakeLeaves ./microvmProfiles {inherit inputs cell;}
