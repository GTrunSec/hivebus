{
  inputs,
  cell,
}: let
  inherit (cell) homeModules homeProfiles;
in {
  mathematical = with homeProfiles; [
    homeModules.latex
  ];
}
