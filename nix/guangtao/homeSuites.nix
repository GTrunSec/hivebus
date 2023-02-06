{
  inputs,
  cell,
}: let
  inherit (cell) homeProfiles homeModules;
in {
  desktop = with homeProfiles;
    default
    ++ terminal
    ++ emacs
    ++ applications
    ++ inputs.cells.display.homeSuites.guangtao
    ++ inputs.cells.secrets.homeSuites.full;

  macbook = with homeProfiles;
    default
    ++ emacs
    ++ terminal
    ++ [
    ]
    ++ inputs.cells.utils.homeSuites.mathematical;

  libvirtd = homeProfiles.default;
}
