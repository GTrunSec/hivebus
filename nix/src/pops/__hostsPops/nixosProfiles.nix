{root, inputs}:
(root.pops.nixosProfiles.addLoadExtender {
  load = {
    type = "nixosProfiles";
  };
})
