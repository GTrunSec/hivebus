{
  omnibus,
  inputs,
  projectRoot,
}:
(omnibus.pops.nixosProfiles.addLoadExtender {
  load = {
    type = "nixosProfilesOmnibus";
    inputs = {
      inputs = {
        inherit (omnibus.flake.inputs) nil nickel typst;
      };
    };
  };
})
