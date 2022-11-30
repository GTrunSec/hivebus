{
  inputs,
  cell,
}: {
  bootstrap = [
    inputs.cells.base.nixosModules.nix
    inputs.cells.base.nixosModules.openssh
  ];
  networking = [
    inputs.cells.networking.nixosProfiles.nat
  ];
  disk = [
    # ssd setting
    inputs.cells.base.nixosProfiles.fstrim
  ];
}
