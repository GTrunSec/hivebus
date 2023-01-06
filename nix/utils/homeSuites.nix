{
  inputs,
  cell,
}: let
  inherit (cell) homeModules homeProfiles;
in {
  mathematic = with homeProfiles; [
    homeModules.latex
  ];
}
