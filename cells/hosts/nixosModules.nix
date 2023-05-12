{
  inputs,
  cell,
}: {
  flops = inputs.cells.common.lib.loadNixOS ./nixosModules/flops {
    inherit inputs cell;
    pkgs' = inputs.nixpkgs;
  };
}
