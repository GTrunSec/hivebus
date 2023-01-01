{
  inputs,
  cell,
}: {
  home.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    MOZ_ENABLE_WAYLAND = "1";
    WLR_RENDERER = "vulkan";
    SDL_VIDEODRIVER = "wayland";
    _JAVA_AWT_WM_NONREPARENTING = 1;
    GDK_BACKEND = "wayland";
    NIXOS_OZONE_WL = "1";
  };
}
