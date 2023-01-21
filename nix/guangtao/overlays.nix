{
  inputs,
  cell,
}: let
  l = inputs.nixpkgs.lib // builtins;
  inherit (inputs.cells.common.lib) __inputs__;
in
  {
    desktop = [
      cell.overlays.default
      cell.overlays.python
      cell.overlays.overrides

      __inputs__.rust-overlay.overlays.default
      __inputs__.nixpkgs-wayland.overlays.default

      inputs.cells.emacs.overlays.emacs-overlay

      inputs.cells.utils.overlays.vscode
      inputs.cells.utils.overlays.vscode-extensions
      # __inputs__.nixpkgs-hardenedlinux.overlays.python
    ];
    macbook = [
      cell.overlays.default
      inputs.cells.emacs.overlays.emacs-darwin
    ];
    libvirtd = [];
  }
  // inputs.cells.common.lib.importRakeLeaves ./overlays {inherit inputs cell;}
