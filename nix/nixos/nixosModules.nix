{
  inputs,
  cell,
}:
(inputs.cells.common.lib.loadNixOS ./nixosModules {inherit inputs cell;}).addInputs {
  pkgs' = inputs.nixpkgs;
}
