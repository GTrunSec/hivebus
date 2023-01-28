{
  inputs,
  cell,
}: {
  default = [
    cell.nixosProfiles.yubikey
    cell.nixosProfiles.sops
    cell.nixosProfiles.age
  ];
  minimal = [cell.nixosProfiles.age];
}
