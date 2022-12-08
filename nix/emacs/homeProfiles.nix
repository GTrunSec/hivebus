{
  inputs,
  cell,
}: let
  doom = import ./homeProfiles/doom.nix {inherit inputs cell;};
in {
  linux = {
    imports = [
      doom
      cell.homeModules.linux
      cell.homeModules.doom
    ];
  };
  darwin = {
    imports = [
      doom
      cell.homeModules.darwin
      cell.homeModules.doom
    ];
  };
}
