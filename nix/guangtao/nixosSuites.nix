{
  inputs,
  cell,
}: let
  inherit (cell) nixosProfiles;
in {
  desktop = with nixosProfiles;
    bootstrap
    ++ networking
    ++ disk
    ++ secrets
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

  libvirtd = with nixosProfiles;
    bootstrap
    ++ [
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
