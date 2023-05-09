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
    yabai
    cell.nixosModules.python
    cell.nixosModules.rust
    (cell.lib.mkHome "guangtao" "macbook" "zsh" "22.11")
  ];
}
