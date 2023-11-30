{ inputs, cell }:
let
  inherit (inputs.flops.lib.configs) pops;
  inherit (inputs.flops.inputs) POP;
  inherit (inputs) haumea;

  l = inputs.nixpkgs.lib // builtins;
in
{
  hosts = { };
}
