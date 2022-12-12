{
  inputs,
  cell,
}: let
  inherit (cell) homeProfiles homeModules;
in rec {
  default = with homeProfiles;
    [
      shellPrograms
      shellPackages
    ]
    ++ [
      inputs.cells.base.homeProfiles.default
      inputs.cells.utils.homeProfiles.default
    ]
    ++ inputs.cells.terminal.homeSuites.default;

  mathematic = with homeProfiles; [
    latexPackages
  ];

  desktop = with homeProfiles;
    [
      inputs.cells.terminal.homeProfiles.alacritty
      homeModules.alacritty
      inputs.cells.emacs.homeProfiles.linux
    ]
    ++ default
    ++ mathematic;

  macbook = with homeProfiles;
    default
    ++ mathematic
    ++ [
      inputs.cells.emacs.homeProfiles.darwin
      darwinPackages
    ];

  libvirtd = default;
}
