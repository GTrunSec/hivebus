let
  inherit (inputs) nixpkgs darwin;
in
darwin.lib.darwinSystem rec {
  system = super.layouts.system;
  pkgs = super.layouts.hive.pkgs;
  modules = lib.flatten [super.layouts.darwinSuites];
}
