{
  config,
  lib,
  pkgs,
  ...
}: {
  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 130;
    gtk.enable = true;
    x11.enable = true;
  };
}
