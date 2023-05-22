{profiles}: {pkgs, ...}: let
  src = profiles + "/hyprland";
in {
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    extraConfig = builtins.readFile "${src}/hyprland.conf";
    xwayland = {
      enable = true;
      hidpi = true;
    };
    hive = {
      nvidia = true;
      autoLogin = true;
      swww = true;
    };
  };
}
