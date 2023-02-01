{
  inputs,
  cell,
}:
{
  default = {
    systemd-initrd.imports =
      [
        inputs.cells.bootstrap.nixosModules.systemd-initrd
      ]
      ++ inputs.cells.bootstrap.nixosSuites.default;
    systemd-boot.imports =
      [
        inputs.cells.bootstrap.nixosModules.systemd-initrd
      ]
      ++ inputs.cells.bootstrap.nixosSuites.default;
  };

  graphical = {
    default.imports =
      [
        inputs.cells.hardware.nixosModules.opengl
        cell.nixosProfiles.nixgl
        # gtk modules
        cell.nixosProfiles.dfconf
        cell.nixosModules.fonts
        inputs.cells.desktop.nixosModules.xdg
        inputs.cells.i18n.nixosModules.fcitx5
        # audio modules
        inputs.cells.hardware.nixosModules.bluetooth
        inputs.cells.hardware.nixosModules.pipewire
      ]
      ++ inputs.cells.desktop.nixosSuites.guangtao;

    nvidia.imports = [
      cell.nixosModules.nvidia
    ];
    hidpi.imports = [
      inputs.cells.hardware.nixosModules.hidpi
    ];
  };

  virtualization.imports = [
    inputs.cells.virtualization.nixosProfiles.guangtao
  ];

  networking.imports = [
    inputs.cells.networking.nixosProfiles.nat
  ];
}
// inputs.cells.common.lib.importRakeLeaves ./nixosProfiles {inherit cell inputs;}
