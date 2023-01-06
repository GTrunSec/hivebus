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
    ++ inputs.cells.desktop.homeSuites.guangtao;

  macbook = with homeProfiles;
    default
    ++ emacs
    ++ [
    ]
    ++ inputs.cells.utils.homeSuites.mathematical;

  libvirtd = homeProfiles.default;
}
