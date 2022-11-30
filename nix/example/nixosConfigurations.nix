{
  inputs,
  cell,
}: let
  inherit (cell) nixosSuites;
  inherit (inputs.cells.common.lib) __inputs__;
in {
  home = {
    bee = rec {
      system = "x86_64-linux";
      bee.pkgs = import inputs.nixos {
        overlays = [
          __inputs__.emacs-overlay.overlay
        ];
        inherit system;
      };
    };
    imports = [
      cell.homeModules.emacs
    ];
  };
}
