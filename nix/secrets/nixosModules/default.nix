{
  inputs,
  cell,
}: {
  sops = inputs.cells.common.lib.__inputs__.sops-nix.nixosModules.sops;
  age = inputs.cells.common.lib.__inputs__.ragenix.nixosModules.age;
}
