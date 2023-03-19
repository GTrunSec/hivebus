{pkgs, ...}: {
  home.packages = with pkgs; [
    tdesktop
    (mkWaylandApp zoom-us "zoom-us" ["--enable-features=UseOzonePlatform" "--ozone-platform=wayland"])
    slack
    discord
    # (mkWaylandApp element-desktop "element-destkop" "--add-flags '--enable-features=UseOzonePlatform --ozone-platform=wayland'" "nixgl")
    (mkWaylandApp element-desktop "element-desktop" ["--ozone-platform=wayland"])
    (mkWaylandApp signal-desktop "signal-desktop" ["--ozone-platform=wayland" "--enable-wayland-ime"])
  ];
}
