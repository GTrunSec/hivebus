{
  inputs,
  cell,
}: {
  default =
    (inputs.cells.common.lib.loadNixOS (inputs.self + "/nixos/nixosModules") {
      inherit inputs cell;
    })
    .addInputs {
      pkgs' = inputs.nixpkgs;
    };
  #
}
