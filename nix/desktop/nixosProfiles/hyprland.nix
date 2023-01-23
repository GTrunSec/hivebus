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
    imports = [cell.nixosModules.greetd];
    services.greetd = {
      package = nixpkgs.greetd.tuigreet;
      settings = {
        initial_session.command = "Hyprland";
        # default_session.command = "${nixpkgs.greetd.tuigreet}/bin/tuigreet --time --cmd ${__inputs__.hyprland.packages.default}/bin/Hyprland";
        default_session.command = "${nixpkgs.greetd.greetd}/bin/agreety --cmd Hyprland";
      };
    };
  };

  guangtao = {
    imports =
      [
        (default {nvidia = true;})
        (displayManager {
          nvidia = true;
          autoLogin = true;
          user = "guangtao";
        })
      ]
      ++ [
        # cell.nixosProfiles.hyprland.greetd
      ];
    # services.greetd.settings.initial_session.user = "guangtao";
  };
}
