{
  inputs,
  cell,
}: let
  inherit (inputs.cells.common.lib) __inputs__;
  inherit (inputs) nixpkgs std self;

  src = "${(std.incl self ["profiles/hyprland"])}/profiles/hyprland";
in {
  inherit cell;
  default = {
    imports = [
      __inputs__.hyprland.homeManagerModules.default
      cell.homeProfiles.hyprland.homeSession
      cell.homeProfiles.hyprland.packages
      cell.homeProfiles.hyprland.windowManager
    ];
  };
  windowManager = {
    wayland.windowManager.hyprland = {
      enable = true;
      systemdIntegration = true;
      xwayland = {
        enable = true;
        hidpi = true;
      };
    };
  };
  homeSession = {
    home.sessionVariables = {
      XDG_SESSION_TYPE = "wayland";
      # QT_QPA_PLATFORMTHEME = "qt5ct";
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
      MOZ_ENABLE_WAYLAND = 1;
      QT_QPA_PLATFORM = "wayland";
    };
  };

  packages = {
    home.packages = with nixpkgs; [];
  };

  zsh = {
    programs.zsh = {
      loginExtra = ''
        # If running from tty1 start hyprland
        [ "$(tty)" = "/dev/tty1" ] && Hyprland
      '';
    };
  };

  guangtao = {
    imports = [
      cell.homeProfiles.hyprland.default
      cell.homeProfiles.hyprland.zsh
    ];
    wayland.windowManager.hyprland.extraConfig = builtins.readFile "${src}/hyprland.conf";
    wayland.windowManager.hyprland.nvidiaPatches = true;
  };
}
