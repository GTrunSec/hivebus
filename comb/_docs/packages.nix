{ inputs, cell }:

let
  inherit (inputs.cells._main.lib.__misc__) styx;
in
{
  inherit (styx.packages) styx;
  inherit (cell.config.default.hive) site;
}
