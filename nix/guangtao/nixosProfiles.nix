{
  inputs,
  cell,
}: let
  profiles = inputs.cells.common.lib.rakeLeaves ./nixosProfiles;
in {
  bootstrap.imports = [
    inputs.cells.base.nixosModules.nix
    inputs.cells.base.nixosModules.openssh
    inputs.cells.boot.nixosProfiles.tmp
  ];

  graphics.imports = [
    inputs.cells.hardware.nixosModules.hidpi
    cell.nixosModules.nvidia
  ];

  locale.imports = [
    inputs.cells.i18n.nixosModules.fcitx5
  ];

  virtualization.imports = [
    inputs.cells.virtualization.nixosModules.libvirtd
  ];

  searching.imports = [];

  coding.imports = [];

  databases.imports = [];

  networking.imports = [
    inputs.cells.networking.nixosProfiles.nat
  ];

  disk.imports =
    [
      inputs.disko.nixosModules.disko
      profiles.zsh
      {
        disko.devices = cell.diskoConfigurations.desktop {};
      }
    ]
    ++
    # ssd setting
    inputs.cells.hardware.nixosSuites.ssd;

  secrets.imports =
    [
      inputs.cells.secrets.nixosModules.sops
    ]
    ++ [
      inputs.cells.secrets.nixosModules.age
      inputs.cells.secrets.nixosProfiles.age
      ({config, ...}: {
        age.secrets.root-user.file = ./secretProfiles/root-user.age;
        users.users.root = {
          passwordFile = config.age.secrets.root-user.path;
        };
      })
    ];
}
