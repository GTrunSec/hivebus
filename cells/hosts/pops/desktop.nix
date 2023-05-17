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

  opensshPublicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDLxc7EBr1Qi4M65O1KjXZf4bOBZMQ6YeDSFYzKzFan7 Desktop-guangtao-03-02-2023";
}
