{
  inputs,
  exports,
  __inputs__,
}: let
  l = inputs.nixpkgs.lib // builtins;
in [
  exports.overlays.packages
  exports.overlays.default
  exports.overlays.nodePackages
  exports.overlays.python

  __inputs__.rust-overlay.overlays.default
  __inputs__.nixpkgs-wayland.overlays.default
  __inputs__.poetry2nix.overlay
  __inputs__.typst.overlays.default
  __inputs__.nur.overlay
  __inputs__.julia2nix.overlays.default

  __inputs__.emacs-overlay.overlays.default
  exports.overlays.vscode
  exports.overlays.vscode-extensions
]
