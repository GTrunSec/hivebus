{
  omnibus,
  inputs,
  projectRoot,
}:
(omnibus.pops.nixosProfiles.addLoadExtender {
  load = {
    src = projectRoot + /units/nixos/nixosProfiles;
    inputs = {
      inputs = inputs;
    };
  };
})
