{
  inputs,
  cell,
}: let
  inherit (inputs) std;

  l = inputs.nixpkgs.lib // builtins;
in {
  just = {
    data = {
      tasks = import ./justfile.nix {inherit inputs cell;};
    };
  };
}
