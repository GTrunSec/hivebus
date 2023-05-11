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
    (cell.lib.mkHome "guangtao" "flops" "zsh")

    self.nixosSuites
  ];

  overlays = overlays.flops;

  nixosSuites = [
    exports.nixosModules.default
    (l.attrValues exports.nixosProfiles.preset.bootstrap)
    exports.nixosProfiles.preset.virtualisation.docker
    exports.nixosProfiles.preset.virtualisation.libvirtd
  ];

  homeSuites = [
    exports.homeModules.default
    exports.homeProfiles.shell.default
  ];
}
