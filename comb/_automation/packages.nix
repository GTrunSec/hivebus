{
  inputs,
  cell,
}: let
in {
  inherit (inputs.cells.main.lib.__default__.colmena.packages) colmena;
}
