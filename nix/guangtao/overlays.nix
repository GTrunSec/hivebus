{
  inputs,
  cell,
}: let
  l = inputs.nixpkgs.lib // builtins;
  inherit (inputs.cells.common.lib) __inputs__;

  profiles = inputs.cells.common.lib.importRakeLeaves ./overlays;
in {
  inherit profiles;

  desktop = [
    inputs.cells.emacs.overlays.emacs-overlay
    profiles.default
    profiles.desktop
    __inputs__.rust-overlay.overlays.default
  ];
  macbook = [
    profiles.default
    inputs.cells.emacs.overlays.emacs-darwin
  ];
  libvirtd = [];
}
