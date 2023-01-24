{
  inputs,
  cell,
}:
{
  default.imports =
    [
      inputs.cells.bootstrap.nixosModules.systemd-initrd
    ]
    ++ inputs.cells.bootstrap.nixosSuites.default;

  graphical.imports =
    [
      inputs.cells.hardware.nixosModules.hidpi
      cell.nixosModules.nvidia
      inputs.cells.hardware.nixosModules.opengl
      # wayland require
      inputs.cells.security.nixosModules.polkit
      # gtk require
      cell.nixosProfiles.dfconf
      cell.nixosModules.fonts
      inputs.cells.desktop.nixosModules.xdg
      cell.nixosProfiles.nixgl
      # cell.nixosProfiles.nixgl
    ]
    ++ [
      # use home-manager instead
      inputs.cells.desktop.nixosProfiles.hyprland.guangtao
    ]
    ++ [
      # audio
      inputs.cells.hardware.nixosModules.bluetooth
      inputs.cells.hardware.nixosModules.pipewire
    ]
    ++ [
      inputs.cells.i18n.nixosModules.fcitx5
    ]
    ++ inputs.cells.desktop.nixosSuites.guangtao;

  locale.imports = [
    inputs.cells.i18n.nixosModules.fcitx5
  ];

  virtualization.imports = [
    inputs.cells.virtualization.nixosProfiles.guangtao
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
      inputs.cells.filesystems.nixosProfiles.impermanence.guangtao
    ]
    ++
    # ssd setting
    inputs.cells.hardware.nixosSuites.ssd;

  secrets.imports = [
    # inputs.cells.secrets.nixosProfiles.sops
    inputs.cells.secrets.nixosProfiles.age
  ];

  desktopOnly.imports = [
    cell.nixosProfiles.desktopServices
  ];

  applications.imports = [
    inputs.cells.utils.nixosProfiles.vscode
  ];
}
// inputs.cells.common.lib.importRakeLeaves ./nixosProfiles {inherit cell inputs;}
