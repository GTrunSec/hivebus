{
  inputs,
  cell,
}: let
in {
  inherit (inputs.cells._main.lib.__default__.colmena.packages) colmena;
}
