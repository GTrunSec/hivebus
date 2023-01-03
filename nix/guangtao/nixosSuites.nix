{
  inputs,
  cell,
}: let
  inherit (cell) nixosProfiles;
  inherit (inputs) nixpkgs;
in {
  desktop = with nixosProfiles;
    [
      bootstrap
      networking
      graphics
      disk
      secrets
      locale
      virtualization
      coding.desktop
      desktopOnly
    ]
    ++ [
      (cell.lib.mkHome "guangtao" "desktop" "zsh" "22.11")
      cell.userProfiles.root
    ];

  libvirtd = with nixosProfiles;
    [
      bootstrap
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
