{
  omnibus,
  inputs,
  projectRoot,
}:
(omnibus.pops.nixosProfiles.addLoadExtender {
  load = {
    type = "nixosProfilesOmnibus";
    src = projectRoot + /units/nixos/darwinProfiles;
    inputs = {
      inputs = inputs;
    };
  };
})
