{self}:
{
  default = [
    {
      boot.cleanTmpDir = true;
      boot.tmp.cleanOnBoot = true;
      zramSwap.enable = true;
      documentation.enable = false;
    }
  ];
  contabo = [
    self.default
    (
      {modulesPath, ...}:
      {
        imports = [(modulesPath + "/profiles/qemu-guest.nix")];
        hive.bootstrap.contabo = true;
      }
    )
  ];
}
