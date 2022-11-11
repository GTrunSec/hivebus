{
  inputs,
  cell,
}: let
  inherit (cell) nixosProfiles;
in {
  desktop = with nixosProfiles;
    [
      inputs.cells.input.nixosModules.fcitx5
      inputs.cells.vm.nixosModules.libvirtd
    ]
    ++ [
      cell.userProfiles.default
      {
        home-manager.users.guangtao = {inherit (cell.homeConfigurations.destkop) imports;};
      }
    ];
}
