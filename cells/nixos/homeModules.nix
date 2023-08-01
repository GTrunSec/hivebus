{ inputs, cell }:
{
  default =
    (inputs.cells.common.lib.loadNixOS (inputs.self + "/nixos/homeModules") {
      inherit inputs cell;
      __inputs__ = inputs.cells.common.lib.__inputs__;
    }).addInputs
      {
        pkgs' = inputs.nixpkgs;
        lib = inputs.nixpkgs.lib;
      };
}
