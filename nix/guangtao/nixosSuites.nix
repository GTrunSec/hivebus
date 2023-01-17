{
  inputs,
  cell,
}: let
  inherit (cell) nixosProfiles;
  inherit (inputs) nixpkgs;
in {
  desktop = with nixosProfiles;
    [
      default
      networking
      graphical
      disk
      secrets
      locale
      virtualization
      coding.desktop
      cell.nixosModules.Desktop
      applications
    ]
    ++ [
      (cell.lib.mkHome "guangtao" "desktop" "zsh" "22.11")
      cell.userProfiles.root
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
