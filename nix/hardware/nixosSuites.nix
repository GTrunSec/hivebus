{
  inputs,
  cell,
}: let
  inherit (cell) nixosModules;
in {
  ssd = [
    cell.nixosModules.fstrim
  ];
}
