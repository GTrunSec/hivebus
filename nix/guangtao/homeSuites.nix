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
      inputs.cells.terminal-emulators.homeModules.zsh
      inputs.cells.base.homeProfiles.default
      inputs.cells.utils.homeProfiles.default
    ];

  desktop = with homeProfiles;
    [
      inputs.cells.terminal-emulators.homeProfiles.alacritty
      homeModules.alacritty
      inputs.cells.emacs.homeProfiles.linux
    ]
    ++ default;

  macbook = with homeProfiles;
    default
    ++ [
      inputs.cells.emacs.homeProfiles.darwin
    ];

  libvirtd = default;
}
