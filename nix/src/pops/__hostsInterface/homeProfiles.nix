{ root, inputs }:
(root.pops.homeProfiles.addLoadExtender {
  load = {
    type = "nixosProfiles";
  };
})
