{
  inputs,
  cell,
}:
{
  # https://github.com/ryantm/agenix
  age = {
    imports = [
      inputs.cells.common.lib.__inputs__.ragenix.nixosModules.age
    ];
  };
  sops = {
    imports = [inputs.cells.common.lib.__inputs__.sops-nix.nixosModules.sops];
  };
  yubikey = {
    imports = [];
  };
}
// inputs.cells.common.lib.importRakeLeaves ./nixosProfiles {inherit inputs cell;}
