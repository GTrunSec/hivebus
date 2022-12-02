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

      inputs.cells.version-management.homeProfiles.git
    ]
    ++ [
      inputs.cells.terminal-emulators.homeProfiles.alacritty
      inputs.cells.terminal-emulators.homeModules.zsh
      homeModules.alacritty
      inputs.cells.base.homeProfiles.default
      inputs.cells.utils.homeProfiles.default
    ];

  desktop = with homeProfiles;
    default
    ++ [
      inputs.cells.emacs.homeProfiles.default
    ];

  libvirtd = default;
}
