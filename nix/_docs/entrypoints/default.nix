{
  inputs,
  cell,
}: let
  inherit (inputs.std.lib.ops) writeScript;
in {
  styx = writeScript {
    name = "mkdoc-hive";
    runtimeInputs = [cell.packages.styx];
    text = ''
      cd "$PRJ_ROOT"/docs/styx
      styx serve
    '';
  };
}
