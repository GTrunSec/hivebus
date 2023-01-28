{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    yubikey-manager
  ];
  services.udev.packages = [pkgs.yubikey-personalization];
}
