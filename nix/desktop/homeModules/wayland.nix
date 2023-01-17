{pkgs, ...}: {
  home.packages = with pkgs; [
    wlr-randr
    qt5.qtwayland
    wayland-utils
    wlr-randr
  ];
}
