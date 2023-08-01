{ lib, inputs }:
let
  inherit (inputs) haumea;
  __inputs__ = inputs.cells.common.lib.__inputs__;
in
{
  _imports = lib.attrValues (
    haumea.lib.load {
      src = ./__config;
      loader = haumea.lib.loaders.path;
    }
  );
}
