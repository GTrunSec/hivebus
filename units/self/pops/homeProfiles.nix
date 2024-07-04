{
  omnibus,
  inputs,
  projectRoot,
}:
(omnibus.pops.homeProfiles.addLoadExtender {
  load = {
    type = "nixosProfilesOmnibus";
    src = projectRoot + /units/nixos/homeProfiles;
    inputs = {
      inputs = inputs // {
        dotfiles = projectRoot + /local/dotfiles;
      };
    };
  };
})
