{ root, inputs }:
(root.pops.nixosModules.addLoadExtender {
  load = {
    inputs = {
      inputs = inputs;
    };
  };
})
