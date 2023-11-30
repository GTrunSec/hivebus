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
    self.nixosSuites
    inputs.disko.nixosModules.disko
    {
      hive.bootstrap = {
        minimal = true;
      };
      fileSystems."/persist".neededForBoot = true;
      disko.devices = cell.diskoConfigurations.btrfs-legacy { disk = "/dev/sda"; };
    }

    inputs.cells.users.nixosProfiles.root
    exports.nixosProfiles.cloud.contabo
  ];

  overlays = [ ];

  nixosSuites = [
    exports.nixosModules.default
    (l.attrValues exports.nixosProfiles.preset.bootstrap)
  ];

  opensshPublicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIz+2YjcxpmNnUwaf3pwxot0T4eiG80t34ihyfUkWZiq root@nixos-cloud";
}
