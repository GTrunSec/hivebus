{
  inputs,
  cell,
}: let
in
  final: prev: {
    python3Override = inputs.nixos-unstable.legacyPackages.${inputs.nixpkgs.system}.python3;

    promnesia = prev.python3Packages.callPackage ../packages/python/promnesia {
      orgparse = final.orgparse;
      hpi = final.hpi;
    };
    orgparse = prev.python3Packages.callPackage ../packages/python/orgparse {};
    hpi = prev.pythonPackages.callPackage ../packages/python/HPI {};
  }
