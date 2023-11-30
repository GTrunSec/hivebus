{ inputs, cell }:
{
  "/persist".neededForBoot = true;
  _imports = [
    inputs.disko.nixosModules.disko
    {
      disko.devices = cell.diskoConfigurations.btrfs-legacy { disk = "/dev/sda"; };
    }
  ];
}
