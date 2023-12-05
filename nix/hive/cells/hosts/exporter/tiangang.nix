{
  self',
  cell,
  inputs,
  self,
}:
let
  l = inputs.nixpkgs.lib // builtins;
  inherit (inputs.cells.nixos.pops) exports;
in
{
  imports = [
    self'.exports.nixosModules.tiangang.default
    {
      hive.bootstrap = {
        contabo = true;
      };
    }
    self.nixosSuites
    inputs.cells.users.nixosProfiLes.root

    exports.nixosProfiles.cloud.contabo
  ];

  overlays = self'.exports.overlays.tiangang;

  nixosSuites = [
    exports.nixosModules.default
    (l.attrValues exports.nixosProfiles.preset.bootstrap)

    exports.nixosProfiles.preset.secrets.age
  ];

  opensshPublicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILw5XTIFs8s7zNy5ZX+GH/8bZzEMOCBkDPnagz0opMPo root@nixos";
}
