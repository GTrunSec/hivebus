{
  self',
  overlays,
  cell,
  nixosModules,
  inputs,
  self,
}: let
  l = inputs.nixpkgs.lib // builtins;
  inherit (inputs.cells.nixos.pops) exports;
in {
  imports = [

    # nixosModules.flops
    (cell.lib.mkHome "guangtao" "flops" "zsh")

    self.darwinSuites
  ];

  overlays = overlays.macbook;

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
    exports.homeProfiles.shell.users.guangtao
    exports.homeProfiles.apps.darwin
  ];
}
