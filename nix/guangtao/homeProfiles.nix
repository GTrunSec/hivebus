{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs;
  l = inputs.nixpkgs.lib // builtins;
in
  l.mapAttrs (_: v: import v {inherit inputs cell;})
  (inputs.cells.common.lib.rakeLeaves ./homeProfiles)
