{
  inputs,
  super,
  lib,
}:
let
  inherit (inputs) nixpkgs;
in
nixpkgs.lib.nixosSystem rec {
  system = super.layouts.system;
  pkgs = super.layouts.hive.bee.pkgs;
  modules = lib.flatten [ super.layouts.nixosSuites ];
}
