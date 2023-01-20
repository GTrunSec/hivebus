{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs;
  inherit (inputs.cells.common.lib) __inputs__;
in {
  default = {
    imports = [
      __inputs__.hyprland.nixosModules.default
      cell.nixosModules.hyprland
    ];
  };

  displayManager = {
    imports = [cell.nixosModules.sddm];
    services.xserver.displayManager.sessionPackages = [__inputs__.hyprland.packages.default];
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

  autoLogin = {
    services.xserver.displayManager = {
      autoLogin = {
        enable = true;
      };
      defaultSession = "hyprland";
    };
  };

  guangtao = {
    imports =
      [
        cell.nixosProfiles.hyprland.default
        cell.nixosProfiles.hyprland.displayManager
        cell.nixosProfiles.hyprland.autoLogin
      ]
      ++ [
        # cell.nixosProfiles.hyprland.greetd
      ];
    # services.greetd.settings.initial_session.user = "guangtao";
    services.xserver.displayManager = {
      autoLogin = {
        user = "guangtao";
      };
    };
  };
}
