{
  inputs,
  cell,
}: let
  inherit (inputs.std.lib.ops) writeScript;
in {
  hive = writeScript {
    name = "mkdoc-hive";
    runtimeInputs = [cell.packages.styx];
    text = ''
      cd "$PRJ_ROOT"/docs/hive
      styx serve
    '';
  };
}
