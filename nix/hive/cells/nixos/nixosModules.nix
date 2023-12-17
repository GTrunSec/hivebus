{ inputs, cell }:
let
  l = inputs.nixpkgs.lib // builtins;
in
{
  default =
    inputs.cells.common.lib.loadNixOS (inputs.self + "/nixos/nixosModules")
      {
        inherit inputs cell;
        lib = inputs.nixpkgs.lib;
        pkgs' = inputs.nixpkgs;
        __inputs__ = inputs.cells.common.lib.__inputs__;
      };
  # .addMerge (final:
  #   with inputs.dmerge;
  #     merge final {
  #       imports = append [
  #         (inputs.self + "/nixos/nixosModules/_imports.nix")
  #       ];
  #     });
  outputs = inputs.flops.lib.haumea.pops.default.setInit {
    src = inputs.self + "/nixos/nixosModulesOutputs";
    # loader = l.const l.id;
    inputs = {
      inherit inputs cell;
      lib = inputs.nixpkgs.lib;
      pkgs' = inputs.nixpkgs;
      __inputs__ = inputs.cells.common.lib.__inputs__;
    };
    transformer = [
      (
        _cursor: dir:
        if dir ? default then
          assert (l.attrNames dir == [ "default" ]); dir.default
        else
          dir
      )
    ];
  };
}
