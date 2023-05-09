{
  config,
  pkgs,
  ...
}: {
  services.dbus = {
    enable = true;
    packages = with pkgs; [
      pass-secret-service
      gcr
      dconf
    ];
  };
  services.passSecretService = {
    enable = true;
  };
  services.udev.packages = with pkgs; [gnome.gnome-settings-daemon];
}
