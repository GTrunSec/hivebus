{
  super,
  lib,
  inputs,
}:
{
  default = [
    { home.stateVersion = "24.11"; }
    super.pops.omnibus.homeProfiles.exports.macbook.shell.full
    inputs.self.homeProfiles.presets.git
    inputs.self.homeProfiles.presets.zsh.default
    inputs.self.homeProfiles.apps.doomemacs-macbook
    super.pops.homeProfiles.exports.default.shell.wezterm
  ];
}
