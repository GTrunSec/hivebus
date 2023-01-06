# Adapted on 3rd of July 2021 from
# https://github.com/gytis-ivaskevicius/flake-utils-plus/blob/438316a7b7d798bff326c97da8e2b15a56c7657e/lib/repl.nix
{flakePath}: let
  Flake =
    if builtins.pathExists flakePath
    then
      (import (fetchTarball {
        url = "https://github.com/edolstra/flake-compat/archive/009399224d5e398d03b22badca40a37ac85412a1.tar.gz";
        sha256 = "0xcr9fibnapa12ywzcnlf54wrmbqqb96fmmv8043zhsycws7bpqy";
      }) {src = toString flakePath;})
      .defaultNix
    else {};

  Channels = Flake.pkgs.${builtins.currentSystem} or <nixpkgs>;

  LoadFlake = path: builtins.getFlake (toString path);
in {
  inherit
    Channels
    Flake
    LoadFlake
    ;
}
