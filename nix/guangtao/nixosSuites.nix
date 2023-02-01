{
  inputs,
  cell,
}: let
  inherit (cell) nixosProfiles;
  inherit (inputs) nixpkgs;
in {
  desktop = with nixosProfiles;
    [
      default.systemd-initrd
      graphical.default
      graphical.nvidia
      graphical.hidpi
      networking
      virtualization
      coding.desktop
    ]
    ++ [
      (cell.lib.mkHome "guangtao" "desktop"
        "zsh" "22.11")
      cell.userProfiles.root
      desktop
    ]
    ++ inputs.cells.secrets.nixosSuites.full;

  libvirtd = with nixosProfiles;
    [
      default
      inputs.cells.secrets.nixosProfiles.age
    ]
    ++ [
      virtualization
    ]
    ++ [
      cell.userProfiles.root
      (cell.lib.mkHome "admin" "libvirtd_1" "zsh" "22.11")
    ];
}
