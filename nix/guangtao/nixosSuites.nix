{
  inputs,
  cell,
}: let
  inherit (cell) nixosProfiles;
in {
  desktop = with nixosProfiles;
    [
      inputs.cells._input.nixosModules.fcitx5
    ]
    ++ [
      cell.userProfiles.default
      {
        home-manager.users.guangtao = {inherit (cell.homeConfigurations.destkop) imports;};
      }
    ];
}
