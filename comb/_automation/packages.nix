{
  inputs,
  cell,
}: let
in {
  inherit (cell.lib.__default__.colmena.packages) colmena;
}
