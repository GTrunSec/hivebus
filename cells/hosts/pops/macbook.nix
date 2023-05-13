{
  self',
  cell,
  inputs,
  self,
}: let
  l = inputs.nixpkgs.lib // builtins;
  inherit (inputs.cells.nixos.pops) exports;
in {
  imports = [
    # darwinModules.macbook
    (cell.lib.mkHome "guangtao" "macbook" "zsh")

    self.darwinSuites
  ];

  overlays = self'.exports.overlays.macbook;

  darwinSuites = [
    # exports.darwinModules.default
    (l.attrValues exports.darwinProfiles.preset.bootstrap)
    (l.attrValues exports.darwinProfiles.preset.homebrew.taps)
    # load the all profiles by default
    # or exports.darwinProfiles.preset.homebrew.brews.apps)
    (l.attrValues exports.darwinProfiles.preset.homebrew.brews)
    (l.attrValues exports.darwinProfiles.preset.homebrew.casks)

    exports.nixosProfiles.preset.coding.rust
    exports.nixosProfiles.preset.coding.python
    exports.nixosProfiles.preset.coding.nix
  ];

  homeSuites = [
    exports.homeModules.default
    exports.homeProfiles.shell.default
    # load user's specific profiles
    exports.homeProfiles.preset.users.guangtao
    exports.homeProfiles.apps.darwin
    exports.homeProfiles.preset.emacs.doomemacs
  ];
}
