{
  inputs,
  cell,
}: let
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

  autoLogin = {
    services.xserver.displayManager = {
      autoLogin = {
        enable = true;
      };
      defaultSession = "hyprland";
      # session = [
      #   {
      #     manage = "desktop";
      #     name = "Hyprland";
      #     start = "exec Hyprland";
      #   }
      # ];
    };
  };
  guangtao = {
    imports = [
      cell.nixosProfiles.hyprland.default
      cell.nixosProfiles.hyprland.displayManager
      cell.nixosProfiles.hyprland.autoLogin
    ];
    services.xserver.displayManager = {
      autoLogin = {
        user = "guangtao";
      };
    };
  };
}
