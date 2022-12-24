{
  inputs,
  cell,
}: {
  emacs-overlay = inputs.cells.common.lib.__inputs__.emacs-overlay.overlays.default;
  emacs-darwin = final: prev: {
    inherit
      (inputs.cells.common.lib.__inputs__.emacs-darwin.packages.${inputs.nixpkgs.system})
      emacs
      ;
  };
}
