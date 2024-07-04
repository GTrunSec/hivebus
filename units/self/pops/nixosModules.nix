{
  omnibus,
  inputs,
  projectRoot,
}:
(omnibus.pops.nixosModules.addLoadExtender {
  load = {
    src = projectRoot + /units/nixos/nixosModules;
    inputs = {
      inputs = inputs;
    };
  };
})
