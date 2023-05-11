{
  inputs,
  cell,
}: {
  default =
    (inputs.cells.common.lib.loadNixOS (inputs.self + "/nixos/nixosModules") {
      inherit inputs cell;
      lib = inputs.nixpkgs.lib;
      pkgs' = inputs.nixpkgs;
    });
}
