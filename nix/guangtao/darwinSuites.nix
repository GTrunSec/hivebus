{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs;
  inherit (cell) darwinProfiles;
in {
  macbook = with darwinProfiles;
    bootstrap
    ++ [
      {
        home-manager.users.gtrun = {
          inherit (cell.homeConfigurations.macbook) imports;
          home.stateVersion = "22.11";
        };
      }
    ];
}
