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
    ]
    ++ [
      (cell.lib.mkHome "guangtao" "desktop" "22.11")
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
          password = "nixos";
          shell = nixpkgs.zsh;
        };
      }
    ];
}
