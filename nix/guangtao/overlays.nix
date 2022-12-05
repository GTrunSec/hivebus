{
  inputs,
  cell,
}: {
  desktop = [
    inputs.cells.emacs.overlays.emacs-overlay
  ];
  macbook = [
    inputs.cells.emacs.overlays.emacs-darwin
  ];
  libvirtd = [];
}
