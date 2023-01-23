{
  inputs,
  cell,
}: let
  inherit (inputs.cells-lab.writers.lib) writeShellApplication;

  l = inputs.nixpkgs.lib // builtins;
in {
  swww-random = writeShellApplication {
    name = "swww-random";
    runtimeInputs = with inputs.nixpkgs; [ cell.packages.swww];
    text = l.fileContents ./swww_randomize.sh;
  };
}
