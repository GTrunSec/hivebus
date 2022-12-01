{
  fstrim = ./fstrim.nix;
  firmware = {
    services.fwupd.enable = true;
  };
}
