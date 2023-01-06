{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs;
  l = nixpkgs.lib // builtins;
in {
  emacs-overlay = inputs.cells.common.lib.__inputs__.emacs-overlay.overlays.default;
  emacs-darwin = final: prev: {
    inherit
      (inputs.cells.common.lib.__inputs__.emacs-darwin.packages.${inputs.nixpkgs.system})
      emacs
      ;
  };
}
