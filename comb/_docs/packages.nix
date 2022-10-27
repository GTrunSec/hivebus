{
  inputs,
  cell,
}: let
  inherit (inputs.cells._common.lib.__misc__) styx;
in {
  inherit (styx.packages) styx;
  inherit (cell.config.default.hive) site;
}
