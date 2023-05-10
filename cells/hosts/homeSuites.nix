{
  inputs,
  cell,
}: let
  l = inputs.nixpkgs.lib // builtins;
  inherit (cell.pops) exports;
  inherit (exports.homeProfiles) preset;
in {
  flops = [
    exports.homeModules.default
    exports.homeProfiles.shell.default
  ];
}
