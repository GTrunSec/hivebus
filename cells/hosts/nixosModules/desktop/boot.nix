{
  _imports = [
    ({pkgs, ...}: {
      boot.kernelPackages = pkgs.linuxPackages_latest;
    })
  ];
  binfmt.emulatedSystems = ["aarch64-linux"];
  tmp.useTmpfs = true;
  tmp.tmpfsSize = "65%";
  initrd = {
    availableKernelModules = ["xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod"];
    kernelModules = [
      "ec_sys"
      "uhid"
      "kvm-intel"

      # "dhack"
    ];
  };
}
