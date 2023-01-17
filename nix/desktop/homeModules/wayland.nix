{pkgs, ...}: {
  home.packages = with pkgs; [
    wlr-randr
    qt5.qtwayland
    wayland-utils
    wlr-randr
    wf-recorder
    wl-clipboard
    grim # Grab images from a Wayland compositor
    ksnip
    kooha # Elegantly record your screen
  ];
}
