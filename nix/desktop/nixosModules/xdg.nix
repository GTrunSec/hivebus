{
  config,
  pkgs,
  ...
}: {
  xdg = {
    mime.enable = true;
    icons.enable = true;
    portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
    };
  };
  environment.systemPackages = with pkgs; [
    xdg-utils
  ];
}
