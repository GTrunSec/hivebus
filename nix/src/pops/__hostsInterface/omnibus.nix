{
  omnibus,
  inputs,
  haumea,
}:
(omnibus.pops.load {loader = with haumea; [((matchers.nix loaders.default))];})
