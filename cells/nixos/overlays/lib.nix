{secretsPath}: final: prev: let
in {
  lib = prev.lib.extend (lself: lsuper: {
    age.file = file: secretsPath + file;
  });
}
