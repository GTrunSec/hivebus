{
  boot = {
    loader = {
      timeout = 0;
      efi.canTouchEfiVariables = true;
    };
    initrd = {
      systemd.enable = true;
    };
  };
}
