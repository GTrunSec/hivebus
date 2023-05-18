_: {pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    lxqt.pavucontrol-qt
  ];

  hardware.bluetooth = {
    package = pkgs.bluez5-experimental;
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;
}
