{
  default = {
    hardware.enableRedistributableFirmware = true;
  };
  intel = ./intel.nix;
  hidpi = ./hidpi.nix;
  lvm = ./lvm.nix;
}
