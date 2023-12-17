{ inputs, cell }:
let
  inherit (inputs) nixpkgs;
  inherit (inputs.hivebus.inputs) omnibus;
  inputs' = (omnibus.pops.flake.setSystem nixpkgs.system).inputs;
in
# inherit (omnibus.pops.self.load.inputs) POP flops;
{
  configs = omnibus.pops.configs {
    inputs = {
      inputs = {
        inherit (inputs') nixfmt topiary nur;
        inherit (inputs) std;
        inherit nixpkgs;
      };
    };
  };
}
