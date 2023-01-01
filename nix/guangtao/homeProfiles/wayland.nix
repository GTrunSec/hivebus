{
  inputs,
  cell,
}: {
  home.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    MOZ_ENABLE_WAYLAND = true;
    WLR_RENDERER = "vulkan";
    LIBSEAT_BACKEND = "logind";
    LIBVA_DRIVER_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = 1;
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    SDL_VIDEODRIVER = "wayland";
    GDK_BACKEND = "wayland";
    _JAVA_AWT_WM_NONREPARENTING = 1;
    MOZ_ENABLE_WAYLAND = true;
    QT_QPA_PLATFORM = "wayland";
  };
}
