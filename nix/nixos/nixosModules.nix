{
  inputs,
  cell,
}: {
  default =
    (inputs.cells.common.lib.loadNixOS (inputs.self + "/nixos/modules") {
      inherit inputs cell;
      lib = inputs.nixpkgs.lib;
    })
      .addInputs {
        pkgs' = inputs.nixpkgs;
      };
}
