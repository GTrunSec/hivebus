{
  lib,
  inputs,
  super,
  root,
  projectDir,
  omnibus,
}:
let
  inherit (omnibus.lib.omnibus) mkHosts;
in
mkHosts {
  hostsDir = projectDir + "/units/nixos/hosts";
  pops = super.hostsInterface;
  addLoadExtender = {
    load = {
      inputs = {
        inherit inputs;
      };
    };
  };
}
