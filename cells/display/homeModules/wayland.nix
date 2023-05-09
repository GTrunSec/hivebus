{pkgs, ...}: {
  home.packages = with pkgs; [
    qt5.qtwayland
    wayland-utils
    wlr-randr
    wf-recorder
    wl-clipboard
    grim # Grab images from a Wayland compositor
    # ksnip
    sway-contrib.grimshot # Screenshot utility for Wayland
    kooha # Elegantly record your screen
    sunpaper # Wallpaper manager for Wayland
  ];
}
