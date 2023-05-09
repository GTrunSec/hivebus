{
  inputs,
  cell,
}: {
  flops =
    (inputs.cells.common.lib.loadNixOS ./nixosModules/flops {
      inherit inputs cell;
    })
    .addInputs {
      pkgs' = inputs.nixpkgs;
    };
}
