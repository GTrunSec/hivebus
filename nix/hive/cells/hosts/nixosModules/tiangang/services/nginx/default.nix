{ lib, inputs }:
let
  inherit (inputs) haumea;
in
{
  _imports = lib.attrValues (
    haumea.lib.load {
      src = ./_config;
      inputs = {
        inputs = inputs;
      };
    }
  );
  enable = true;
}
