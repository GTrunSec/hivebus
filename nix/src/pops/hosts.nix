{
  lib,
  inputs,
  super,
  root,
  projectDir,
  omnibus,
}:
let
  hostsDir = (projectDir + "/units/nixos/hosts");
  inherit (omnibus.lib) addLoadToPopsFilterBySrc;
in
addLoadToPopsFilterBySrc hostsDir super.hostsPops {
  inputs = {
    inputs = inputs;
  };
}
