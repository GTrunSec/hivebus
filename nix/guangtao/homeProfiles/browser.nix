{
  inputs,
  cell,
}: {...}: let
  inherit (inputs) nixpkgs;
in {
  home.packages = with nixpkgs; [
    brave
  ];
}
