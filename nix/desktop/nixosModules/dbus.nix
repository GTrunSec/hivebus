{
  config,
  pkgs,
  ...
}: {
  services.dbus = {
    enable = true;
  };

  services.dbus.packages = with pkgs; [
    pass-secret-service
  ];
}
