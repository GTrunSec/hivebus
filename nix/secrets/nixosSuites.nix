{
  inputs,
  cell,
}: rec {
  default = [
    cell.nixosProfiles.yubikey
    cell.nixosProfiles.sops
    cell.nixosProfiles.age
  ];

  full =
    default
    ++ [
      cell.nixosModules._1password
      cell.nixosModules.gnome-keyring
    ];

  minimal = [cell.nixosProfiles.age];
}
