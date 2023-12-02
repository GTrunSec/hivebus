{root, inputs}:
name:
(root.pops.homeModules.addLoadExtender {
  load = {
    inputs = {
      inputs = inputs;
    };
  };
})
