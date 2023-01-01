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
    ]
    ++ [
      (cell.lib.mkHome "guangtao" "desktop" "22.11")
      cell.userProfiles.root
      {
        users.users."guangtao" = {
          shell = nixpkgs.zsh;
        };
      }
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
      (cell.lib.mkHome "admin" "libvirtd_1" "22.11")
      {
        users.users."admin" = {
          shell = nixpkgs.zsh;
        };
      }
    ];
}
