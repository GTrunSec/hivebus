{
  config,
  lib,
  ...
}: let
  cfg = config.wayland.windowManager.hyprland;
  cfg' = config.wayland.windowManager.hyprland.hiveProfiles;
in
  with lib; {
    options = {
      wayland.windowManager.hyprland = {
        hiveProfiles = mkOption {
          default = {};
          type = types.submodule {
            options = {
              greetd = mkOption {
                type = types.bool;
                default = false;
                description = "Name of the profile";
              };
              getty = mkOption {
                type = types.bool;
                default = false;
                description = "Name of the profile";
              };
              user = mkOption {
                type = types.str;
                default = "hyprland";
                description = "Name of the user";
              };
              displayManager = mkOption {
                type = types.bool;
                default = false;
                description = "Description of the profile";
              };
              nvidia = mkOption {
                type = types.bool;
                default = false;
                description = "nvidia profile";
              };
              shell = mkOption {
                type = types.str;
                default = "zsh";
                description = "Shell of the profile";
              };
              autoLogin = mkOption {
                type = types.bool;
                default = false;
                description = "Auto login to the Hyprland";
              };
            };
          };
        };
      };
    };

    config = mkIf cfg.enable (mkMerge [
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
        programs.${cfg'.shell} = {
          loginExtra = ''
            # If running from tty1 start hyprland
            if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
              Hyprland
            fi
          '';
        };
      })
    ]);
  }
