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
    services.xserver.displayManager.sessionPackages = [__inputs__.hyprland.packages.default];
  };

  autoLogin = {
    services.xserver.displayManager = {
      autoLogin = {
        enable = true;
        user = "guangtao";
      };
      defaultSession = "Hyprland";
      session = [
        {
          manage = "desktop";
          name = "Hyprland";
          start = "exec Hyprland";
        }
      ];
    };
  };
}
