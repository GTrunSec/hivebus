{
  root,
  self,
  lib,
}: let
  inherit (root) preset;
in {
  linux = [
    preset.chat
    preset.dropbox
    preset.firefox
    preset.brave
    preset.office
    self.doomemacs
  ];

  darwin = [
    self.doomemacs
    preset.diagrams
  ];

  doomemacs = [
    preset.emacs.default
    preset.emacs.doomemacs
    preset.emacs.tree-sitter
    preset.emacs.packages
  ];
}
