{
  inputs,
  cell,
}: let
  inherit (cell) nixosProfiles;
in {
  desktop = with nixosProfiles;
    bootstrap
    ++ [
      inputs.cells.input.nixosModules.fcitx5
      inputs.cells.virtualization.nixosModules.libvirtd
    ]
    ++ [
      cell.userProfiles.gtrun
      {
        home-manager.users.guangtao = {inherit (cell.homeConfigurations.destkop) imports;};
      }
    ];

  libvirt = with nixosProfiles;
    [
      inputs.cells.input.nixosModules.fcitx5
      inputs.cells.virtualization.nixosModules.libvirtd
    ]
    ++ [
      cell.userProfiles.root
      cell.userProfiles.admin
      {
        home-manager.users.admin = {imports = cell.homeSuites.shell;};
      }
    ];
}
