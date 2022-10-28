{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs;
  inherit (inputs.cells._common.lib.__inputs__) styx;
in {
  inherit (styx.packages.${nixpkgs.system}) styx;
}
