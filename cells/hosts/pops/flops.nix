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
    self'.exports.nixosModules.flops
    (cell.lib.mkHome "guangtao" "flops" "zsh")

    inputs.cells.users.nixosProfiles.root

    self.nixosSuites
  ];

  overlays = self'.exports.overlays.flops;

  nixosSuites = [
    exports.nixosModules.default
    (l.attrValues exports.nixosProfiles.preset.bootstrap)
    exports.nixosProfiles.preset.virtualisation.docker
    exports.nixosProfiles.preset.virtualisation.libvirtd

    exports.nixosProfiles.preset.secrets.age
  ];

  homeSuites = [
    exports.homeModules.default
    exports.homeProfiles.shell.default
  ];
}
