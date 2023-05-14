{
  default = [
    {
      boot.tmp.cleanOnBoot = true;
      zramSwap.enable = true;
      documentation.enable = false;
    }
  ];
}
