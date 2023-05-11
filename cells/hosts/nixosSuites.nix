{inputs, cell}:
let
  l = inputs.nixpkgs.lib // builtins;
in
{
  flops = [
    (l.attrValues inputs.cells.nixos.pops.exports.nixosProfiles.bootstrap)
  ];
}
