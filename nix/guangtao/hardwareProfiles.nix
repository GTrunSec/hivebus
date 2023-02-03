{
  inputs,
  cell,
}: {
  desktop = {
    pkgs,
    lib,
    ...
  }: {
    imports =
      [
        inputs.disko.nixosModules.disko
        inputs.cells.filesystems.nixosProfiles.impermanence.guangtao
        {disko.devices = cell.diskoConfigurations.desktop {};}
        # inputs.nixos-hardware.nixosModules.common-gpu-nvidia
      ]
      ++ inputs.cells.hardware.nixosSuites.ssd;

    boot.kernelPackages = pkgs.linuxPackages_latest;

    boot.loader.grub.device = lib.mkForce "/dev/disk/by-id/ata-CT1000MX500SSD1_2039E4B362FC";

    # hardware.nvidia.prime = {
    #   nvidiaBusId = "PCI:1:0:0";
    #   intelBusId = "PCI:0:2:0";
    # };

    boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod"];

    hardware.enableRedistributableFirmware = true;

    hardware.enableAllFirmware = true;

    powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";

    fileSystems."/DATABASE-4TB" = {
      device = "/dev/disk/by-uuid/749df476-c355-469a-9d00-4565a07901bf";
      options = ["x-systemd.automount"];
      fsType = "xfs";
    };

    fileSystems."/persist".neededForBoot = true;
  };
}
