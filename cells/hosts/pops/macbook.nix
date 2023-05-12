{
  self',
  overlays,
  cell,
  nixosModules,
  inputs,
  self,
}: let
  l = inputs.nixpkgs.lib // builtins;
  inherit (inputs.cells.nixos.pops) exports;
in {
  imports = [

    # nixosModules.flops
    (cell.lib.mkHome "guangtao" "flops" "zsh")

    self.darwinSuites
  ];

  overlays = overlays.macbook;

  darwinSuites = [
    # exports.darwinModules.default
    (l.attrValues exports.darwinProfiles.preset.bootstrap)
    (l.attrValues exports.darwinProfiles.preset.homebrew.taps)
    (l.attrValues exports.darwinProfiles.preset.homebrew.brews)
    (l.attrValues exports.darwinProfiles.preset.homebrew.casks)
  ];

  homeSuites = [
    exports.homeModules.default
    exports.homeProfiles.shell.default
    exports.homeProfiles.apps.darwin
  ];
}
