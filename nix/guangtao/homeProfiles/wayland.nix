{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs;
in {
  home.packages = with nixpkgs; [
    qt5.qtwayland
    wayland-utils
    kanshi
  ];

  home.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
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
  wayland.windowManager.hyprland.extraConfig = ''
     $mod = SUPER

     # monitor=,3840x2160,auto,2
     monitor = DP-2, preferred, auto, 1

     exec-once = kanshi
     exec-once = eww open bar

     bind = $mod, Return, exec, alacritty
     bind = $mod, B, exec, brave
     bind = $mod, D, exec, pkill rofi || ~/.config/rofi/launcher.sh

     compositor commands
     bind = $mod SHIFT, E, exec, pkill Hyprland
     bind = $mod, Q, killactive,
     bind = $mod, F, fullscreen,
     bind = $mod, G, togglegroup,
     $kw = dwindle:no_gaps_when_only
     bind = $mod, M, exec, hyprctl keyword $kw $(($(hyprctl getoption $kw -j | jaq -r '.int') ^ 1))


     # window resize
     bind = $mod, S, submap, resize

     submap = resize
     binde = , right, resizeactive, 10 0
     binde = , left, resizeactive, -10 0
     binde = , up, resizeactive, 0 -10
     binde = , down, resizeactive, 0 10
     bind = , escape, submap, reset
     submap = reset

     # workspace

    bind = $mod, 1, workspace, 1
    bind = $mod, 2, workspace, 2
    bind = $mod, 3, workspace, 3
    bind = $mod, 4, workspace, 4
    bind = $mod, 5, workspace, 5
    bind = $mod, 6, workspace, 6
    bind = $mod, 7, workspace, 7
    bind = $mod, 8, workspace, 8
    bind = $mod, 9, workspace, 9
    bind = $mod, 0, workspace, 10
    bind = $mod, L, workspace, +1
    bind = $mod, H, workspace, -1
    bind = $mod, period, workspace, e+1
    bind = $mod, comma, workspace,e-1
  '';

  programs.zsh = {
    loginExtra = ''
      # If running from tty1 start hyprland
      [ "$(tty)" = "/dev/tty1" ] && exec Hyprland
    '';
  };
}
