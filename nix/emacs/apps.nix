{
  inputs,
  cell,
}: let
  l = inputs.nixpkgs.lib // builtins;
in {
  jinx-compile = {
    program = l.getExe cell.entrypoints.jinx-compile;
    type = "app";
  };
}
