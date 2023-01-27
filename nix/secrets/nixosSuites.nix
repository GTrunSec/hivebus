{
  inputs,
  cell,
}: {
  guangtao = [
    cell.nixosProfiles.yubikey
    cell.nixosProfiles.sops
    cell.nixosProfiles.age
  ];
}
