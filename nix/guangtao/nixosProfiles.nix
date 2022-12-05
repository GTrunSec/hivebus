{
  inputs,
  cell,
}: {
  bootstrap.imports = [
    inputs.cells.base.nixosModules.nix
    inputs.cells.base.nixosModules.openssh
    inputs.cells.boot.nixosProfiles.tmp
  ];

  graphics.imports = [
    inputs.cells.hardware.nixosProfiles.hidpi
  ];

  searching.imports = [];

  coding.imports = [];

  databases.imports = [];

  networking.imports = [
    inputs.cells.networking.nixosProfiles.nat
  ];

  disk.imports = [
    # ssd setting
    inputs.cells.base.nixosProfiles.fstrim
  ];

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
