{ flops, haumea }:
let
  inherit (flops.lib.haumea) pops;
in
src: inputs:
pops.default.setInit {
  src = src;
  inputs = inputs;
  transformer = with haumea.lib.transformers; [
    liftDefault
    (hoistLists "_imports" "imports")
    (hoistAttrs "_options" "options")
  ];
  target = "nixosModules";
}
