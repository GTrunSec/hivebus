{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs;
  inherit (cell) darwinProfiles;
in {
  macbook = with darwinProfiles; [
    bootstrap
    homebrew
    (cell.lib.mkHome "gtrun" "macbook" "zsh" "22.11")
  ];
}
