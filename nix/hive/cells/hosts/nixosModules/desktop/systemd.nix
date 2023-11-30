{
  # Speed up boot
  # https://discourse.nixos.org/t/boot-faster-by-disabling-udev-settle-and-nm-wait-online/6339
  # services.systemd-udev-settle.enable = false;
  # services.NetworkManager-wait-online.enable = false;
}
