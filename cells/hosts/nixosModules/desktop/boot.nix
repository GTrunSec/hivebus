{
  _imports = [
    ({pkgs, ...}: {
      boot.kernelPackages = pkgs.linuxPackages_latest;
    })
  ];
  tmp.useTmpfs = true;
  tmp.tmpfsSize = "65%";
  initrd.availableKernelModules = ["xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod"];
}
