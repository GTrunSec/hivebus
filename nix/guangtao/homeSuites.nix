{
  inputs,
  cell,
}: let
  inherit (inputs.cells) guangtao;
  inherit (cell) homeProfiles;
in {
  shell = with homeProfiles; [
    guangtao.homeModules.alacritty
    shellPrograms
    shellPackages
  ];
}
