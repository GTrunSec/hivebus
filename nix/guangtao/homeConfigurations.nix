{
  inputs,
  cell,
}: let
  inherit (inputs) nixos home;
in let
in {
  destkop = {
    inherit (cell.nixosConfigurations.desktop) bee;
    home = rec {
      homeDirectory = "/home/${username}";
      stateVersion = "22.05";
      username = "guangtao";
    };
    imports = cell.homeSuites.shell;
  };
}
