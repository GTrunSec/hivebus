{
  inputs,
  cell,
}: let
  inherit (inputs.cells.common.lib) __inputs__;
in
  final: prev: {
    guangtao-sources =
      (prev.callPackage ../packages/_sources/generated.nix {})
      // (
        prev.callPackage ../packages/emacs/_sources/generated.nix {}
      );

    material-symbols = prev.callPackage ../packages/material-symbols.nix {};

    inherit (__inputs__.nickel.packages) nickel;

    inherit (__inputs__.nil.packages) nil;

    mind-wave = final.poetry2nix.mkPoetryEnv {
      projectDir = ../packages/mind-wave;
    };
  }
