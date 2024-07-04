{
  eachSystem,
  super,
  inputs,
  lib,
}:
lib.mapAttrs (_: v: eachSystem v) {
  scripts = system: super.pops.eachSystem.scripts.${system}.exports.default;
  apps = system: super.pops.eachSystem.scripts.${system}.exports.apps;
  packages =
    system:
    super.pops.eachSystem.packages.${system}.exports.derivations
    // {
      data = super.pops.eachSystem.data.${system}.exports.default;
    };
}
