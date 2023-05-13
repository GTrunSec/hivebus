{secretsPath}: final: prev: let
  in {
  lib = prev.lib.extend (lself: lsuper: {
    age.file = file: lsuper.path.append secretsPath file;
  });
}
