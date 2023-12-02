{inputs, cell}:
{
  "/persist".neededForBoot = true;
  "/DATABASE-4TB" = {
    device = "/dev/disk/by-uuid/749df476-c355-469a-9d00-4565a07901bf";
    options = ["x-systemd.automount"];
    fsType = "xfs";
  };
  _imports = [
    inputs.disko.nixosModules.disko
    {
      disko.devices = cell.diskoConfigurations.btrfs-legacy {
        # boot.loader.grub.device = lib.mkForce "/dev/disk/by-id/ata-CT1000MX500SSD1_2039E4B362FC";
        # lsblk -f
        # disk = "/dev/disk/by-uuid/4ffe8e29-1608-48d5-94c3-a685620a723b";
        disk = "/dev/sda";
        # disk = "/dev/disk/by-id/ata-SanDisk_SDSSDH3500G_180243422621";
      };
    }
  ];
}
