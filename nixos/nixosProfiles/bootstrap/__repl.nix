inputs: {flakePath}: let
  __inputs__ = inputs.cells.common.lib.__inputs__;

  Flake =
    if builtins.pathExists flakePath
    then
      (import __inputs__.flake-compat.outPath {src = toString flakePath;})
      .defaultNix
    else {};

  Channels = Flake.pkgs.${builtins.currentSystem} or <nixpkgs>;

  LoadFlake = builtins.getFlake (toString flakePath);
in {
  inherit
    Channels
    Flake
    LoadFlake
    ;
}
