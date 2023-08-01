{
  inputs,
  cell,
  profiles,
  __inputs__,
}:
let
  src = profiles + "/eww";

  eww = __inputs__.eww.packages.default;
  eww-wayland = __inputs__.eww.packages.eww-wayland;
in
{
  default = {
    imports = [
      cell.homeModules.eww
      cell.homeProfiles.eww.overlays.default
    ];
  };

  overlays.default.nixpkgs.overlays = [ __inputs__.eww.overlays.default ];

  guangtao = {
    imports = [ cell.homeProfiles.eww.default ];
    programs.eww.configDir = src;
  };
}
