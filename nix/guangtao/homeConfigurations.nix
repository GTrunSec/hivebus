{
  inputs,
  cell,
}: let
  inherit (inputs) nixos home;
in let
in {
  guangtao = {
    inherit (cell.nixosConfigurations.home) bee;
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
