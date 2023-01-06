{
  config,
  pkgs,
  ...
}: {
  services.printing.enable = true;
  services.gnome.gnome-keyring.enable = true;

  environment.systemPackages = with pkgs; [];
}
