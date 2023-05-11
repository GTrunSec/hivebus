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
    nixosModules.flops
    (self'.recipes.nixosModules.flops.outputsForTarget "nixosModules")

    (cell.lib.mkHome "guangtao" "flops" "zsh")

    self.nixosSuites
  ];

  overlays = overlays.flops;

  nixosSuites = [
    (l.attrValues exports.nixosProfiles.bootstrap)
  ];

  homeSuites = [
    exports.homeModules.default
    exports.homeProfiles.shell.default
  ];
}
