{ inputs, lib }:
{
  # imports = [ inputs.self.pops.omnibus.homeProfiles.exports.macbook.presets.alacritty ];
  programs.zoxide = {
    enable = lib.mkForce false;
  };
}
