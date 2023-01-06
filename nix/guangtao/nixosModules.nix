{
  inputs,
  cell,
}:
# {
#   services = inputs.cells.common.lib.rakeLeaves ./nixosModules/services;
# } //
inputs.cells.common.lib.rakeLeaves (inputs.nix-filter.lib.filter {
  root = ./nixosModules;
  exclude = [
    # ./nixosModules/services
  ];
})
