{
  home.sessionVariables = {
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    WLR_NO_HARDWARE_CURSORS = 1;
    NO_AT_BRIDGE = 1; # https://github.com/NixOS/nixpkgs/issues/16327#issuecomment-315729994
  };
}
