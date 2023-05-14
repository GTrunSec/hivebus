{
  lib,
  inputs,
}: let
  inherit (inputs) haumea;
  __inputs__ = inputs.cells.common.lib.__inputs__;
in {
  _imports = lib.attrValues (haumea.lib.load {
    src = ./_config;
    loader = haumea.lib.loaders.path;
  });
  enable = true;
}
