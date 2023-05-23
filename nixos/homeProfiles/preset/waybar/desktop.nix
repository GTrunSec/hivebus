{
  profiles,
  root,
  cell,
  lib,
}: {
  config,
  pkgs,
  ...
}: let
  l = lib // builtins;
  src = profiles + "/waybar";
  inherit (root.preset.waybar) themes;
in {
  home.activation.waybarConfig = config.lib.dag.entryAfter ["writeBoundary"] ''
    ln -sfT ${src}/scripts ~/.config/waybar/scripts
  '';
  home.packages = with pkgs; [
    networkmanagerapplet
    pavucontrol
    pamixer
  ];
  programs.waybar = {
    style = l.readFile "${src}/style.css";
    settings = {
      top = l.recursiveUpdate themes.default.top {
        output = [config.hive.monitor];
        network.on-click-right = "nm-connection-editor";
        "custom/weather" = {
          exec = "python ~/ghq/github.com/GTrunSec/hive/profiles/waybar/scripts/weather.py";
          "on-click" = "xdg-open https://weather.com/en-IN/weather/today/l/f5418ee48ceba432e37ed772ea73abe27c9f47fa4ff4e4506ba3b8fa96f514f0";
        };
        "backlight" = {
          device = config.hive.monitor;
        };
        "custom/power-menu" = {
          on-click = "bash ${src}/scripts/power-menu/powermenu.sh";
        };
        pulseaudio = {
          "on-click" = "pamixer -t";
          "on-click-right" = "pavucontrol";
        };
      };
      # bottom = l.recursiveUpdate themes.default.bottom {
      #   output = ["DP-1"];
      #   "custom/wintitle" = {
      #     exec = "${l.getExe (
      #       pkgs.writeShellApplication {
      #         name = "hyprland-window";
      #         runtimeInputs = with pkgs; [jq];
      #         text = l.fileContents ./hyprland_window.sh;
      #       }
      #     )}";
      #   };
      # };
    };
  };
}
