{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs;
  l = inputs.nixpkgs.lib // builtins;
in {
  overlays =
    l.optionals nixpkgs.stdenv.isDarwin [cell.overlays.emacs-darwin]
    ++ l.optionals nixpkgs.stdenv.isLinux
    [
      cell.overlays.emacs-overlay
      inputs.cells.guangtao.overlays.default
    ];
}
