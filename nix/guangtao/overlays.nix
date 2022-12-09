{
  inputs,
  cell,
}: let
  l = inputs.nixpkgs.lib // builtins;

  profiles =
    l.mapAttrs (_: v: import v {inherit inputs cell;})
    (inputs.cells.common.lib.rakeLeaves ./overlays);
in {
  inherit profiles;

  desktop = [
    inputs.cells.emacs.overlays.emacs-overlay
    profiles.default
    profiles.desktop
  ];
  macbook = [
    profiles.default
    inputs.cells.emacs.overlays.emacs-darwin
  ];
  libvirtd = [];
}
