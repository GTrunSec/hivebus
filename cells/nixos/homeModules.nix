{
  inputs,
  cell,
}: {
  default =
    (inputs.cells.common.lib.loadNixOS (inputs.self + "/nixos/homeModules") {
      inherit inputs cell;
    })
      .addInputs {
        pkgs' = inputs.nixpkgs;
        lib = inputs.nixpkgs.lib;
      };
}
