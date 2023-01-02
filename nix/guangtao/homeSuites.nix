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
    ++ mathematic
    ++ graphics
    ++ applications;

  macbook = with homeProfiles;
    default
    ++ mathematic
    ++ emacs
    ++ [
      darwinPackages
    ];

  libvirtd = homeProfiles.default;
}
