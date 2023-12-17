inputs.haumea.lib.load {
  src = ./userProfiles;
  inputs = {
    inputs = removeAttrs inputs [ "self" ];
    lib = inputs.nixpkgs.lib;
  };
  transformer = with inputs.haumea.lib.transformers; [ liftDefault ];
}
