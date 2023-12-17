(omnibus.pops.homeProfiles.addLoadExtender {
  load = {
    type = "nixosProfilesOmnibus";
    src = inputs.self.outPath + "/units/nixos/homeProfiles";
    inputs = {
      inputs = super.subflake.inputs // {
        self = inputs.self;
        dotfiles = projectRoot + "/local/dotfiles";
      };
    };
  };
})
