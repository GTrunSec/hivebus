{flops, haumea}: let
  inherit (flops.lib) configs;
in
  src: inputs':
   configs.haumea.setInit
    {
      src = src;
      loader = haumea.lib.loaders.scoped;
      inputs = removeAttrs inputs' ["self"];
      transformer = with haumea.lib.transformers; [
        liftDefault
        (hoistLists "_imports" "imports")
        (hoistAttrs "_options" "options")
      ];
    }
