{root, inputs}:
(root.pops.nixosProfiles.addLoadExtender {
  load = {
    inputs = {
      inputs = inputs;
    };
  };
})
