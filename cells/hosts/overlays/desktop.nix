{
  inputs,
  exports,
  __inputs__,
}: let
  l = inputs.nixpkgs.lib // builtins;
in [
  (l.attrValues exports)
  __inputs__.rust-overlay.overlays.default
  __inputs__.nixpkgs-wayland.overlays.default
  __inputs__.poetry2nix.overlay
  __inputs__.typst.overlays.default
  __inputs__.nur.overlay
  __inputs__.julia2nix.overlays.default

  inputs.cells.emacs.overlays.emacs-overlay
  inputs.cells.utils.overlays.vscode
  inputs.cells.utils.overlays.vscode-extensions
]
