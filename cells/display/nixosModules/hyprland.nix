{
  config,
  lib,
  ...
}: let
  cfg = config.programs.hyprland;
  cfg' = config.programs.hyprland.hiveProfiles;
in
  with lib; {
    options = {
      programs.hyprland = {
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
      (mkIf cfg'.displayManager {
        services.xserver.displayManager = {
          autoLogin = mkIf cfg'.autoLogin {
            enable = true;
            user = cfg'.user;
          };
          defaultSession = "hyprland";
        };
      })
      (mkIf (cfg'.displayManager && cfg'.nvidia) {
        services.xserver.videoDrivers = ["nvidia"];
      })
      (mkIf cfg'.greetd {
        environment.etc."greetd/environments".text = "Hyprland";
        environment.etc."greetd/gtkgreet.css".text = ''
          window {
             background-size: cover;
             background-position: center;
          }
          box#body {
             border-radius: 10px;
             position: center;
             padding: 15px;
          }
        '';
        services.greetd = {
          package = pkgs.greetd.gtkgreet;
          settings = rec {
            initial_session = {
              command = "${pkgs.cage}/bin/cage -s -- ${pkgs.greetd.gtkgreet}/bin/gtkgreet -l -s /etc/greetd/gtkgreet.css";
              inherit user;
            };
            default_session = initial_session;
          };
        };
      })
      (mkIf (cfg'.getty && cfg'.autoLogin) {
        services.getty.autologinUser = cfg'.user;
      })
    ]);
  }
