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

  cloud = [
    {
      boot.cleanTmpDir = true;
      zramSwap.enable = true;
      documentation.enable = false;
    }
    cell.nixosModules.openssh
    cell.nixosModules.nix
    cell.nixosModules.services
  ];
}
