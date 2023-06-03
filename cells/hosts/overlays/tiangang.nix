{
  inputs,
  exports,
  __inputs__,
}: [
  exports.overlays.packages
  exports.overlays.lib

  __inputs__.nixpkgs-hardenedlinux.pkgs.overlays.default
  __inputs__.nixpkgs-hardenedlinux.common.lib.__inputs__.nix-npm-buildpackage.overlays.default
  __inputs__.nixpkgs-hardenedlinux.common.lib.__inputs__.gomod2nix.overlays.default
  __inputs__.nixpkgs-hardenedlinux.common.lib.__inputs__.pnpm2nix.overlays.default
]
