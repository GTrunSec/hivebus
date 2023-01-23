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

  greetd = {user ? ""}: {
    imports = [cell.nixosModules.greetd];
    services.getty.autologinUser = user;
    services.greetd = {
      package = nixpkgs.greetd.tuigreet;
      settings = rec {
        initial_session = {
          command = "${nixpkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
          inherit user;
        };
        default_session = initial_session;
      };
    };
  };

  guangtao = {
    imports = [
      # (default {nvidia = true;})
      # (displayManager {
      #   nvidia = true;
      #   autoLogin = true;
      #   user = "guangtao";
      # })
      (greetd {user = "guangtao";})
    ];
  };
}
