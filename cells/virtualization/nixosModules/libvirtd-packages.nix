{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    pkgs.virt-manager
    spice-gtk
  ];
  virtualisation.spiceUSBRedirection.enable = true;
}
