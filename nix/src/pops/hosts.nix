{
  lib,
  inputs,
  super,
  root,
  projectRoot,
  omnibus,
}:
let
  inherit (omnibus.lib.omnibus) mkHosts;
in
lib.recursiveUpdate root.hosts (
  mkHosts {
    hostsDir = projectRoot + "/units/nixos/hosts";
    pops = super.hostsInterface;
    addLoadExtender = {
      load = {
        inputs = {
          inherit inputs;
        };
      };
    };
  }
)
