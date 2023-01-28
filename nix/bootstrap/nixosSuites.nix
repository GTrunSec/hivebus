{
  inputs,
  cell,
}: rec {
  default = [
    cell.nixosModules.base
    cell.nixosModules.nix
    cell.nixosModules.services
    cell.nixosModules.openssh
    cell.nixosModules.tmp
  ];

  minimal =
    [
      inputs.cells.bootstrap.nixosModules.systemd-boot
    ]
    ++ default;
}
