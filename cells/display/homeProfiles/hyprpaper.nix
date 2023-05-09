{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs std self;
  inherit (inputs.cells.common.lib) __inputs__;
  src = "${(std.incl self ["profiles/hyprland"])}/profiles/hyprland";
  inherit (cell) homeProfiles;
in {
  default = {
    imports = [homeProfiles.hyprpaper.packages];
  };

  packages.home.packages = with nixpkgs; [
    __inputs__.hyprpaper.packages.hyprpaper
    swaynotificationcenter
  ];

  guangtao = {
    imports = [
      homeProfiles.hyprpaper.default
    ];
    home.file.".config/hypr/hyprpaper.conf".source = "${src}/hyprpaper.conf";
  };
}
