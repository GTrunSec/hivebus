(omnibus.pops.homeProfiles.addLoadExtender {
  load = {
    type = "nixosProfilesOmnibus";
    src = inputs.self.outPath + "/units/nixos/homeProfiles";
    inputs = {
      inputs = {
        self = inputs.self;
        dotfiles = projectDir + "/local/dotfiles";
      };
    };
  };
})
