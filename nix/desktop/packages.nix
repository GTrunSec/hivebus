{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs;
in {
  swww = nixpkgs.callPackage ./packages/swww.nix {};
}
