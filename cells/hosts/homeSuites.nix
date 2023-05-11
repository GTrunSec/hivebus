{
  inputs,
  cell,
}: let
  l = inputs.nixpkgs.lib // builtins;
  inherit (inputs.cells.nixos.pops) exports;
in {
  flops = [
    exports.homeModules.default
    exports.homeProfiles.shell.default
  ];
}
