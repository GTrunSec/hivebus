{
  inputs,
  cell,
}: let
  l = inputs.nixpkgs.lib // builtins;
in
  l.mapAttrs (name: value: (
    assert value == "directory";
      inputs.cells.common.lib.loadNixOS ./homeModules/${name} {
        inherit inputs cell;
        pkgs' = inputs.nixpkgs;
        lib = inputs.nixpkgs.lib;
      }
  )) (l.readDir ./homeModules)
