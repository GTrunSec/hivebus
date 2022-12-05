{
  inputs,
  cell,
}: {
  emacs-overlay = inputs.cells.common.lib.__inputs__.emacs-overlay.overlays.default;
  emacs-darwin = inputs.cells.common.lib.__inputs__.emacs-darwin.overlay;
}
