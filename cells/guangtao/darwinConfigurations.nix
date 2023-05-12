{
  inputs,
  cell,
}: let
  inherit (cell) nixosSuites;
  l = inputs.nixpkgs.lib // builtins;
in {
  # macbook = import ./darwinConfigurations/macbook {inherit inputs cell;};
}
