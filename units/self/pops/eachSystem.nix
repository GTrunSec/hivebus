{
  eachSystem,
  super,
  inputs,
  lib,
}:
let
  nixos-unstable = inputs.self.subflake.inputs.nixos-unstable;
in
lib.mapAttrs (_: v: eachSystem v) {
  scripts =
    system:
    (super.scripts.addLoadExtender {
      load.inputs = {
        inputs = {
          nixpkgs = nixos-unstable.legacyPackages.${system};
        };
      };
    });

  packages =
    system:
    (super.packages.addLoadExtender {
      load.inputs = {
        inputs = {
          nixpkgs = nixos-unstable.legacyPackages.${system};
        };
      };
    });

  data =
    system:
    (super.data.addLoadExtender {
      load.inputs = {
        nixpkgs = nixos-unstable.legacyPackages.${system};
        inputs = {
          nixpkgs = nixos-unstable.legacyPackages.${system};
        };
      };
    });
}
