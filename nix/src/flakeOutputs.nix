{
  lib,
  super,
  omnibus,
  eachSystem,
  flops,
  projectRoot,
}:
let
  filterConfigs =
    config:
    lib.pipe super.hosts [
      (lib.filterAttrs (_: v: v ? "${config}"))
      (lib.mapAttrs (_: v: v.${config}))
    ];
  inherit (omnibus.lib.omnibus) mapPopsExports;
in
(mapPopsExports super.pops)
// {
  nixosConfigurations = filterConfigs "nixosConfiguration";

  darwinConfigurations = filterConfigs "darwinConfiguration";

  local = eachSystem (
    system:
    let
      inputs' = (super.pops.flake.setSystem system).inputs;
    in
    {
      data =
        (omnibus.pops.allData.addLoadExtender {
          load.src = projectRoot + "/local/data";
        }).exports.default;
    }
  );

  packages = eachSystem (
    system:
    let
      inputs = (super.pops.subflake.setSystem system).inputs;
    in
    (
      (flops.haumea.pops.default.setInit {
        src = projectRoot + /nix/packages;
        loader = _: path: inputs.nixpkgs.callPackage path { };
        transformer = [ (_cursor: dir: if dir ? default then dir.default else dir) ];
      })
    ).exports.default
  );
}
