{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs;
  inherit (inputs.cells.common.lib) __inputs__;
  l = inputs.nixpkgs.lib // builtins;
in rec {
  default = {nvidia ? false}: {
    imports = [
      __inputs__.hyprland.nixosModules.default
      cell.nixosModules.hyprland
    ];
    config = with l;
      mkMerge [
        (mkIf nvidia {programs.hyprland.package = __inputs__.hyprland.packages.hyprland-nvidia;})
      ];
  };

  displayManager = {
    nvidia ? false,
    autoLogin ? false,
    user ? "",
  }: {
    imports = [cell.nixosModules.sddm];
    config = with l;
      mkMerge [
        (mkIf nvidia {services.xserver.videoDrivers = ["nvidia"];})
        (mkIf autoLogin {
          services.xserver.displayManager = {
            autoLogin = {
              enable = true;
              inherit user;
            };
            defaultSession = "hyprland";
          };
        })
      ];
  };

  greetd = {
    user ? "",
    autoLogin ? false,
  }: {
    imports = [];
    config = with l;
      mkMerge [
        (mkIf autoLogin {
          services.getty.autologinUser = user;
        })
        {
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
          # services.greetd = {
          #   package = nixpkgs.greetd.gtkgreet;
          #   settings = rec {
          #     initial_session = {
          #       command = "${nixpkgs.cage}/bin/cage -s -- ${nixpkgs.greetd.gtkgreet}/bin/gtkgreet -l -s /etc/greetd/gtkgreet.css";
          #       inherit user;
          #     };
          #     default_session = initial_session;
          #   };
          # };
        }
      ];
  };

  guangtao = {
    imports = [
      # (default {nvidia = true;})
      # (displayManager {
      #   nvidia = true;
      #   autoLogin = true;
      #   user = "guangtao";
      # })
      (greetd {
        user = "guangtao";
        autoLogin = true;
      })
    ];
  };
}
