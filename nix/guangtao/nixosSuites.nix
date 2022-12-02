{
  inputs,
  cell,
}: let
  inherit (cell) nixosProfiles;
  inherit (inputs) nixpkgs;
in {
  desktop = with nixosProfiles;
    bootstrap
    ++ networking
    ++ graphics
    ++ disk
    ++ secrets
    ++ [
      inputs.cells.i18n.nixosModules.fcitx5
      inputs.cells.virtualization.nixosModules.libvirtd
    ]
    ++ [
      cell.userProfiles.gtrun
      {
        home-manager.users.guangtao = {
          inherit (cell.homeConfigurations.destkop) imports;
          home.stateVersion = "22.11";
        };
      }
    ];

  libvirtd = with nixosProfiles;
    bootstrap
    ++ secrets
    ++ [
      inputs.cells.virtualization.nixosModules.libvirtd
    ]
    ++ [
      cell.userProfiles.root
      cell.userProfiles.admin
      {
        users.users."admin" = {
          password = "nixos";
          shell = nixpkgs.zsh;
        };
        home-manager.users.admin = {
          inherit (cell.homeConfigurations.libvirtd) imports;
          home.stateVersion = "22.11";
        };
      }
    ];
}
