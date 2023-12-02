{root, inputs}:
(root.pops.homeProfiles.addLoadExtender {
  load = {
    inputs = {
      inputs = inputs;
    };
  };
})
