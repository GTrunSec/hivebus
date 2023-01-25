{
  inputs,
  cell,
}: let
  l = inputs.nixpkgs.lib // builtins;
  inherit (inputs) nixpkgs;
in {
  guangtao = {
    imports = [cell.homeModules.waybar];
    home.packages = with nixpkgs; [
      networkmanagerapplet
      pavucontrol #a6da95wi#a6da95wi
      pamixer
    ];
    programs.waybar = {
      style = l.readFile ./style.css;
      settings = {
        top = (l.recursiveUpdate (l.fromJSON (l.readFile ./config-top.json)) {
          output = ["DP-2"];
          network.on-click-right = "nm-connection-editor";
          pulseaudio = {
            "on-click" = "pamixer -t";
            "on-click-right" = "pavucontrol";
          };
        });
      };
    };
  };
}
