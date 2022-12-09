{
  inputs,
  cell,
}:
{
  coding = {
    python = inputs.cells.common.lib.rakeLeaves ./nixosModules/coding/python;
  };
} // inputs.cells.common.lib.rakeLeaves (inputs.nix-filter.lib.filter {
  root = ./nixosModules;
  exclude = [
    ./nixosModules/coding
  ];
})
