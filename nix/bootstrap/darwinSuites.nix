{
  inputs,
  cell,
}: let
  inherit (cell) darwinModules;
in {
  default = with darwinModules; [
    nix
    homebrew
    base
    cell.nixosModules.base
  ];
}
