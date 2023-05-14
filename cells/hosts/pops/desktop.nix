{
  self',
  cell,
  inputs,
  self,
}: let
  l = inputs.nixpkgs.lib // builtins;
  inherit (inputs.cells.nixos.pops) exports;
in {
  imports = [
    self'.exports.nixosModules.destkop
    (cell.lib.mkHome "guangtao" "desktop" "zsh")

    self.nixosSuites
  ];

  overlays = self'.exports.overlays.desktop;

  nixosSuites = [
    exports.nixosModules.default
    (l.attrValues exports.nixosProfiles.preset.bootstrap)

    inputs.nixos-hardware.nixosModules.common-pc-ssd
  ];

  homeSuites = [
    exports.homeModules.default
    exports.homeProfiles.shell.default
  ];
}
