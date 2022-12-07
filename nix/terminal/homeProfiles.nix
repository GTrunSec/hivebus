{
  inputs,
  cell,
}: let
  inherit (cell) homeModules;
in {
  alacritty = ./homeProfiles/alacritty.nix;
  default.imports = with homeModules; [];
}
