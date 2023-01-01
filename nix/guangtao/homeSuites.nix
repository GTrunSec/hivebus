{
  inputs,
  cell,
}: let
  inherit (cell) homeProfiles homeModules;
in {
  desktop = with homeProfiles;
    [
      inputs.cells.terminal.homeProfiles.alacritty
      homeModules.alacritty
    ]
    ++ default
    ++ emacs
    ++ mathematic
    ++ graphics;

  macbook = with homeProfiles;
    default
    ++ mathematic
    ++ emacs
    ++ [
      darwinPackages
    ];

  libvirtd = homeProfiles.default;
}
