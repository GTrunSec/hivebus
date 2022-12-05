{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs;
  inherit (cell) darwinProfiles;
in {
  macbook = with darwinProfiles; [
    bootstrap
    (cell.lib.mkHome "gtrun" "macbook" "22.11")
  ];
}
