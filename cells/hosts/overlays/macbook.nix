{
  inputs,
  exports,
  __inputs__,
}: [
  exports.overlays.packages
  exports.overlays.nodePackages
  __inputs__.rust-overlay.overlays.default
  __inputs__.nixpkgs-wayland.overlays.default
  __inputs__.poetry2nix.overlay
  __inputs__.typst.overlays.default
]