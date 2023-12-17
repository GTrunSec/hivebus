{ inputs, cell }:
let
  l = inputs.nixpkgs.lib // builtins;
in
l.mapAttrs
  (
    name: value:
    (
      assert value == "directory";
      inputs.cells.common.lib.loadNixOS ./nixosModules/${name} {
        inherit inputs cell;
        pkgs' = inputs.nixpkgs;
        lib = inputs.nixpkgs.lib;
        __inputs__ = inputs.cells.common.lib.__inputs__;
      }
    )
  )
  (l.readDir ./nixosModules)
