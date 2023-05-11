{
  inputs,
  cell,
}: let
  l = inputs.nixpkgs.lib // builtins;
  inherit (cell.pops) exports;
in {
  flops = let
    system = "x86_64-linux";
  in {
    bee.system = system;
    bee.home = inputs.home;
    bee.pkgs = import inputs.nixos {
      inherit system;
      config.allowUnfree = true;
      overlays = l.flatten exports.flops.overlays;
    };
    imports = l.flatten exports.flops.imports;
  };
}
