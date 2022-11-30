{
  inputs,
  cell,
}: let
  inherit (cell) homeProfiles homeModules;
in {
  shell = with homeProfiles;
    [
      shellPrograms
      shellPackages

      inputs.cells.version-management.homeProfiles.git
    ]
    ++ [
      inputs.cells.terminal-emulators.homeProfiles.alacritty
      homeModules.alacritty
    ];
}
