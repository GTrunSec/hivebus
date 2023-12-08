{
  inputs,
  super,
  lib,
}:
let
  inherit (inputs) nixpkgs darwin;
in
darwin.lib.darwinSystem rec {
  system = super.layouts.system;
  pkgs = super.layouts.hive.bee.pkgs;
  modules = lib.flatten [super.layouts.darwinSuites];
}
