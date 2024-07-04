(inputs.flops.lib.haumea.pops.default.setInit {
  src = ./overlays;
  inputs = {
    inherit cell;
    inputs = removeAttrs inputs [ "self" ];
    secretsPath = with inputs; "${(std.incl self [ "secrets" ])}/secrets";
    __inputs__ = inputs.cells.common.lib.__inputs__;
  };
})
