{
  inputs,
  cell,
}: let
  inherit (inputs.cells.common.lib) __inputs__;
  inherit (inputs) nixpkgs std self;
  src = "${(std.incl self ["profiles/eww"])}/profiles/eww";

  eww = __inputs__.eww.packages.default;
  eww-wayland = __inputs__.eww.packages.eww-wayland;
in {
  default = {
    imports = [
      cell.homeModules.eww
      cell.homeProfiles.eww.overlays.default
    ];
  };

  overlays.default.nixpkgs.overlays = [
    __inputs__.eww.overlays.default
  ];

  guangtao = {
    imports = [
      cell.homeProfiles.eww.default
    ];
    programs.eww.configDir = src;
  };
}
