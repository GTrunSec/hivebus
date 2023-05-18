{
  inputs,
  cell,
}: {
  default = inputs.cells.common.lib.loadNixOS (inputs.self + "/nixos/nixosModules") {
    inherit inputs cell;
    lib = inputs.nixpkgs.lib;
    pkgs' = inputs.nixpkgs;
    __inputs__ = inputs.cells.common.lib.__inputs__;
  };
  exports = inputs.flops.lib.configs.haumea.setInit {
    src = inputs.self + "/nixos/nixosModulesExports";
    inputs = {
      inherit inputs cell;
      lib = inputs.nixpkgs.lib;
      pkgs' = inputs.nixpkgs;
      __inputs__ = inputs.cells.common.lib.__inputs__;
    };
  };
}
