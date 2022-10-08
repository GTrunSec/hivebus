{
  inputs,
  cell,
} @ args: let
  inherit (cell.packages) styx;
in {
  default = import ./config/_default.nix args;
}
