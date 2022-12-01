{
  inputs,
  cell,
}: {
  bootstrap = [
    inputs.cells.base.nixosModules.nix
    inputs.cells.base.nixosModules.openssh
    inputs.cells.boot.nixosProfiles.tmp
  ];

  graphics = [
    inputs.cells.hardware.nixosProfiles.hidpi
  ];

  searching = [];

  coding = [];

  databases = [];

  networking = [
    inputs.cells.networking.nixosProfiles.nat
  ];

  disk = [
    # ssd setting
    inputs.cells.base.nixosProfiles.fstrim
  ];

  secrets =
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
