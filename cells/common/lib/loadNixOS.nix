{ flops, haumea }:
let
  inherit (flops.lib) configs;
in
src: inputs:
configs.haumea.setInit {
  src = src;
  inputs = removeAttrs inputs [ "inputs" ] // {
    inputs = removeAttrs inputs.inputs [ "self" ];
  };
  transformer = with haumea.lib.transformers; [
    liftDefault
    (hoistLists "_imports" "imports")
    (hoistAttrs "_options" "options")
  ];
}
