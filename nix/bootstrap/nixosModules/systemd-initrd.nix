{
  boot = {
    loader = {
      # timeout = 0;
      efi.canTouchEfiVariables = true;
      # https://discourse.nixos.org/t/configure-grub-on-efi-system/2926/7
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
      };
    };
    initrd = {
      systemd.enable = true;
    };
  };
}
