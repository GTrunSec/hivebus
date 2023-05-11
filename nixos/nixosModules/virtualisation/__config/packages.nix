{pkgs, config, ...}: {
  environment.systemPackages = with pkgs; (lib.optionals config.virtualisation.hive.gui [
    pkgs.virt-manager
    spice-gtk
  ]);
}
