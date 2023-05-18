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
    self'.exports.nixosModules.vultr
    self.nixosSuites

    inputs.cells.users.nixosProfiles.root
  ];

  overlays = self'.exports.overlays.vultr;

  nixosSuites = [
    exports.nixosModules.default
    (l.attrValues exports.nixosProfiles.preset.bootstrap)

    exports.nixosProfiles.preset.secrets.age
    exports.nixosProfiles.cloud.default
  ];

  opensshPublicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIz+2YjcxpmNnUwaf3pwxot0T4eiG80t34ihyfUkWZiq root@nixos-cloud";
}
