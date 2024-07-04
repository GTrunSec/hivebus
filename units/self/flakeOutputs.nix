{ super, eachSystem }:
let
  renamerHiveExports = (super.pops.hive.setNixosConfigurationsRenamer "asd").setHomeConfigurationsRenamer "myHm";
in
{
  inherit (super.pops.hive.exports)
    nixosConfigurations
    darwinConfigurations
    colmenaHive
    homeConfigurations
    ;
  inherit (super) pops;

  renamerNixosConfigurations = renamerHiveExports.exports.nixosConfigurations;
  myHm = renamerHiveExports.exports.homeConfigurations;

  data = super.pops.data.exports.default;

  subflake = super.pops.subflake;

  overlays = super.pops.eachSystem.packages.x86_64-linux.exports.overlays;

  nixosProfiles = super.pops.nixosProfiles.exports.default;
  nixosModules = super.pops.nixosModules.exports.default;

  homeProfiles = super.pops.homeProfiles.exports.default;

  darwinProfiles = super.pops.darwinProfiles.exports.default;

  hosts = super.pops.hosts.exports.default;
}
// super.eachSystem
