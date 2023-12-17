{
  root,
  self,
  lib,
}:
let
  inherit (root) presets;
in
{
  linux = [
    presets.chat
    presets.dropbox
    presets.firefox
    presets.brave
    presets.office
    self.doomemacs
  ];

  doomemacs-macbook = [
    self.doomemacs
    presets.emacs.macbook
  ];

  doomemacs = [
    presets.emacs.doom
    presets.emacs.packages
  ];

  doomemacs-desktop = [
    presets.emacs.desktop
    self.doomemacs
  ];
}
