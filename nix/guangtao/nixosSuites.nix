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
      disk
      secrets
      virtualization
      coding.desktop
      applications
    ]
    ++ [
      (cell.lib.mkHome "guangtao" "desktop" "zsh" "22.11")
      cell.userProfiles.root
      desktop
    ];

  libvirtd = with nixosProfiles;
    [
      default
      secrets
    ]
    ++ [
      virtualization
    ]
    ++ [
      cell.userProfiles.root
      (cell.lib.mkHome "admin" "libvirtd_1" "zsh" "22.11")
    ];
}
