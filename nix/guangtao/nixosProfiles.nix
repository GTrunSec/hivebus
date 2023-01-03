{
  inputs,
  cell,
}:
{
  bootstrap.imports = [
    inputs.cells.base.nixosModules.nix
    inputs.cells.base.nixosModules.openssh
    inputs.cells.boot.nixosProfiles.tmp
    cell.nixosProfiles.corePackages
  ];

  graphics.imports =
    [
      inputs.cells.hardware.nixosModules.hidpi
      cell.nixosModules.nvidia
      # wayland require
      inputs.cells.security.nixosModules.polkit
      # gtk require
      cell.nixosProfiles.dfconf
      cell.nixosModules.fonts
      cell.nixosProfiles.applications
    ]
    ++ [
      # audio
      inputs.cells.hardware.nixosModules.bluetooth
      inputs.cells.hardware.nixosModules.pipewire
    ]
    ++ [
      inputs.cells.i18n.nixosModules.fcitx5
    ];

  locale.imports = [
    inputs.cells.i18n.nixosModules.fcitx5
  ];

  virtualization.imports = [
    inputs.cells.virtualization.nixosModules.libvirtd
  ];

  searching.imports = [];

  coding = {
    desktop.imports = [
      cell.nixosModules.python
      cell.nixosModules.rust
    ];
  };

  databases.imports = [];

  networking.imports = [
    inputs.cells.networking.nixosProfiles.nat
  ];

  disk.imports =
    [
      inputs.disko.nixosModules.disko
      # cell.nixosProfiles.zfs
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
    ];

  desktopOnly.imports = [
    cell.nixosProfiles.desktopServices
  ];
}
// inputs.cells.common.lib.importRakeLeaves ./nixosProfiles
