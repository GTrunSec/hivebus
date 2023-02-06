{pkgs, ...}: {
  home.packages = with pkgs; [
    qt5.qtwayland
    wayland-utils
    wlr-randr
    wf-recorder
    wl-clipboard
    grim # Grab images from a Wayland compositor
    ksnip
    kooha # Elegantly record your screen
    sunpaper # Wallpaper manager for Wayland
  ];
}
