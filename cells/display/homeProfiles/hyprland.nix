{
  inputs,
  cell,
}: let
  inherit (inputs.cells.common.lib) __inputs__;
  inherit (inputs) nixpkgs std self;
  l = inputs.nixpkgs.lib // builtins;

  src = "${(std.incl self ["profiles/hyprland"])}/profiles/hyprland";
in {
  default = {
    imports = [
      __inputs__.hyprland.homeManagerModules.default
      cell.homeModules.hyprland
    ];
    wayland.windowManager.hyprland.enable = true;
  };

  wallpaper = {
    home.packages = [
      cell.packages.swww
      cell.entrypoints.swww-random
    ];
  };

  packages = {
    home.packages = with nixpkgs; [
      swaynotificationcenter
    ];
  };

  guangtao = {
    imports = with cell.homeProfiles.hyprland; [
      default
      wallpaper
      packages
    ];
    home.sessionVariables = {
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      WLR_NO_HARDWARE_CURSORS = 1;
      NO_AT_BRIDGE = 1; # https://github.com/NixOS/nixpkgs/issues/16327#issuecomment-315729994
    };
    wayland.windowManager.hyprland = {
      systemdIntegration = true;
      extraConfig = builtins.readFile "${src}/hyprland.conf";
      xwayland = {
        enable = true;
        hidpi = true;
      };
      hiveProfiles = {
        nvidia = true;
        autoLogin = true;
      };
    };
  };
}
