{flops, haumea}: let
  inherit (flops.lib) configs;
in
  src: inputs:
   configs.haumea.setInit
    {
      src = src;
      inherit inputs;
      transformer = with haumea.lib.transformers; [
        liftDefault
        (hoistLists "_imports" "imports")
        (hoistAttrs "_options" "options")
      ];
    }
