{
  inputs,
  cell,
}: let
  inherit (inputs.cells.guangtao.lib) nixpkgs;
in {
  wezterm = nixpkgs.callPackage ./wezterm/appimage.nix {};
}
