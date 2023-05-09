{
  inputs,
  cell,
}: let
  l = inputs.nixpkgs.lib // builtins;

  inherit (inputs) nixpkgs std self;
  src = "${(std.incl self ["profiles/waybar"])}/profiles/waybar";
in rec {
  default = {
    top = l.fromJSON (l.readFile "${src}/config-top.json");
    bottom = l.fromJSON (l.readFile "${src}/config-bottom.json");
  };

  guangtao = {
    imports = [
      cell.homeModules.waybar
      ({
        pkgs,
        config,
        ...
      }: {
        home.activation.waybarConfig = config.lib.dag.entryAfter ["writeBoundary"] ''
          ln -sfT ${src}/scripts ~/.config/waybar/scripts
        '';
        home.packages = with pkgs; [
          networkmanagerapplet
          pavucontrol
          pamixer
        ];
      })
    ];
    programs.waybar = {
      style = l.readFile "${src}/style.css";
      settings = {
        top = l.recursiveUpdate default.top {
          output = ["DP-2"];
          network.on-click-right = "nm-connection-editor";
          "custom/weather" = {
            exec = "python ~/ghq/github.com/GTrunSec/hive/profiles/waybar/scripts/weather.py";
            "on-click" = "xdg-open https://weather.com/en-IN/weather/today/l/f5418ee48ceba432e37ed772ea73abe27c9f47fa4ff4e4506ba3b8fa96f514f0";
          };
          "backlight" = {
            device = "DP-2";
          };
          "custom/power-menu" = {
            on-click = "bash ${src}/scripts/power-menu/powermenu.sh";
          };
          pulseaudio = {
            "on-click" = "pamixer -t";
            "on-click-right" = "pavucontrol";
          };
        };
        bottom = l.recursiveUpdate default.bottom {
          output = ["DP-2"];
          "custom/wintitle" = {
            exec = "${l.getExe cell.entrypoints.hyprland-window}";
          };
        };
      };
    };
  };
}
