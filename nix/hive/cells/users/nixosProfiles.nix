{inputs, cell}:
let
  l = inputs.nixpkgs.lib // builtins;
in
inputs.haumea.lib.load {
  src = ./nixosProfiles;
  inputs = {
    inputs = removeAttrs inputs ["self"];
    lib = inputs.nixpkgs.lib;
  };
  transformer = with inputs.haumea.lib.transformers; [liftDefault];
}
