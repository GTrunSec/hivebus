{ inputs
, cell
,
}:
let
  l = inputs.nixpkgs.lib // builtins;
  inherit (inputs) nixpkgs;
in
{
  guangtao = {
    imports = [ cell.homeModules.waybar ];
    home.packages = with nixpkgs; [
      networkmanagerapplet
      pavucontrol #a6da95wi#a6da95wi
      pamixer
    ];
    programs.waybar = {
      style = l.readFile ./style.css;
      settings = {
        top = (l.recursiveUpdate (l.fromJSON (l.readFile ./config-top.json)) {
          output = [ "DP-2" ];
          network.on-click-right = "nm-connection-editor";
          "custom/weather" = {
            exec = "python ~/ghq/github.com/GTrunSec/hive/profiles/waybar/scripts/weather.py";
            "on-click" = "xdg-open https://weather.com/en-IN/weather/today/l/f5418ee48ceba432e37ed772ea73abe27c9f47fa4ff4e4506ba3b8fa96f514f0";
          };
          pulseaudio = {
            "on-click" = "pamixer -t";
            "on-click-right" = "pavucontrol";
          };
        });
      };
    };
  };
}
