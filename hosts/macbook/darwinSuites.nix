{
  inputs,
  super,
  omnibus,
}:
{
  default = [
    inputs.self.darwinProfiles.presets.homebrew
    super.pops.omnibus.nixosProfiles.exports.default.dev.coding
    super.pops.omnibus.nixosProfiles.exports.default.presets.coding.node
    inputs.self.nixosProfiles.presets.coding.python
    inputs.self.darwinProfiles.presets.fonts
    omnibus.darwinProfiles.init.default
    (omnibus.src.mkHome {
      user.guangtao = {
        uid = 1000;
        description = "Guangtao's home";
      };
      shell = "zsh";
      suites = [ super.homeSuites.default ];
    })
    {
      nix.gc.user = "root";
      system.stateVersion = 3;
      ids.uids.nixbld = 300;
    }
  ];
}
