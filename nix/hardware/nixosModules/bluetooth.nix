{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    lxqt.pavucontrol-qt
  ];

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;
}
