{
  inputs,
  cell,
}: let
  inherit (inputs.cells.common.lib) __inputs__;
in
  final: prev: {
    python3Override = inputs.nixos-unstable.legacyPackages.${inputs.nixpkgs.system}.python3;

    promnesia = prev.python3Packages.callPackage ../packages/python/promnesia {
      orgparse = final.orgparse;
      hpi = final.hpi;
    };
    orgparse = prev.python3Packages.callPackage ../packages/python/orgparse {};
    hpi = prev.pythonPackages.callPackage ../packages/python/HPI {};

    inherit (__inputs__.nil.packages.${prev.system}) nil;
  }
