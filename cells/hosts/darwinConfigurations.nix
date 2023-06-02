{
  inputs,
  cell,
}: let
  inherit (cell.pops) exports;
  l = inputs.nixpkgs.lib // builtins;
in {
  macbook = let
    system = "aarch64-darwin";
  in {
    bee.system = system;
    bee.home = inputs.home;
    bee.darwin = inputs.darwin;
    bee.pkgs = import inputs.darwin-unstable {
      inherit system;
      config.allowUnfree = true;
      config.permittedInsecurePackages = [
        "nodejs-16.20.0"
      ];
      overlays = l.flatten exports.macbook.overlays;
    };
    imports = l.flatten exports.macbook.imports;
  };
}
