(inputs.flops.lib.configs.haumea.setInit {
  src = ./overlays;
  inputs = {
    inherit cell;
    inputs = removeAttrs inputs ["self"];
  };
})
