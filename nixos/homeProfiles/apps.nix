{
  root,
  self,
  lib,
}: let
  inherit (root) preset;
in {
  nixos = [
    preset.chat
    preset.dropbox
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
