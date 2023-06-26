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
    exports.nixosProfiles.preset.coding.node
  ];

  homeSuites = [
    exports.homeModules.default
    inputs.cells.users.homeProfiles.guangtao

    exports.homeProfiles.shell.default
    # load user's specific profiles
    exports.homeProfiles.apps.darwin
    exports.homeProfiles.preset.emacs.doomemacs
  ];

  opensshPublicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINK1QW0lG58r6yaI9xMQ+D5XA7RUQF8lfBanNs36Wrlw guangtaos-MBP.attlocal.net-guangtao-21-02-2023";
}
