{
  inputs,
  cell,
}: {
  default =
    (inputs.cells.common.lib.loadNixOS (inputs.self + "/nixos/modules") {
      inherit inputs cell;
    })
    .addInputs {
      pkgs' = inputs.nixpkgs;
    };
  #
}
