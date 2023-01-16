{
  inputs,
  cell,
}: {
  imports = [
    cell.nixosProfiles.age
  ];
  age.secretsDir = "/run/keys";
}
