{
  inputs,
  cell,
}: let
  inherit (inputs) nixos home;
in let
in {
  destkop = {
    inherit (cell.nixosConfigurations.desktop) bee;
    imports =
      [
        {
          home = rec {
            homeDirectory = "/home/${username}";
            stateVersion = "22.05";
            username = "guangtao";
          };
        }
      ]
      ++ cell.homeSuites.shell;
  };
}
