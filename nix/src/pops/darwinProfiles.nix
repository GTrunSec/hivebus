(omnibus.pops.darwinProfiles.addLoadExtender {
  load = {
    src = inputs.self.outPath + "/units/nixos/darwinProfiles";
  };
})
