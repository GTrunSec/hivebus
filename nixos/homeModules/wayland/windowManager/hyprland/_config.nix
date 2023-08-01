{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.wayland.windowManager.hyprland;
  cfg' = config.wayland.windowManager.hyprland.hive;
in
with lib; {
  config = mkIf cfg.enable (
    mkMerge [
      {
        home.sessionVariables = {
          QT_QPA_PLATFORM = "wayland";
          SDL_VIDEODRIVER = "wayland";
          GDK_BACKEND = "wayland";
          _JAVA_AWT_WM_NONREPARENTING = 1;
          MOZ_ENABLE_WAYLAND = "1";
          XDG_CURRENT_DESKTOP = "Hyprland";
          XDG_SESSION_DESKTOP = "Hyprland";
          XDG_SESSION_TYPE = "wayland";
        };
      }
      (mkIf cfg'.nvidia {
        wayland.windowManager.hyprland.nvidiaPatches = true;
        home.sessionVariables = {
          LIBVA_DRIVER_NAME = "nvidia";
          GBM_BACKEND = "nvidia-drm";
          __GLX_VENDOR_LIBRARY_NAME = "nvidia";
        };
      })
      (mkIf cfg'.autoLogin {
        programs.zsh = {
          loginExtra = ''
            # If running from tty1 start hyprland
            if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
              Hyprland
            fi
          '';
        };
      })
      (mkIf cfg'.swww {
        home.packages = [
          pkgs.swww
          (pkgs.writeShellApplication {
            name = "swww-random";
            runtimeInputs = [ pkgs.swww ];
            text = lib.fileContents ./swww_randomize.sh;
          })
        ];
      })
    ]
  );
}
