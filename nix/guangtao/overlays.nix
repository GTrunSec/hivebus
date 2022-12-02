{
  inputs,
  cell,
}: {
  desktop = [
    inputs.cells.emacs.overlays.emacs-overlay
  ];
  libvirtd = [];
}
