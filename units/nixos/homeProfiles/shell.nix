{
  root,
  self,
  inputs,
  lib,
}:
let
  inherit (root) presets;
  inherit (inputs) nixpkgs;
in
with presets;
{
  default = [
    git
    # # ------------------------------
    # preset.navi
    (lib.optionals nixpkgs.stdenv.isLinux presets.alacritty)
  ];

  wezterm = [
    self.default
    nushell
    # inputs.self.omnibus.homeProfiles.shell.modernTools
    (lib.optional nixpkgs.stdenv.isDarwin presets.wezterm.default)
  ];

  full = [ self.default ];
}
