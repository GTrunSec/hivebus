{
  inputs,
  cell,
}: let
  inherit (cell) nixosProfiles;
  inherit (inputs) nixpkgs;
in {
  desktop = with nixosProfiles;
    [
      (default {boot = "initrd";})
      graphical.default
      graphical.nvidia
      graphical.hidpi
      networking
      virtualization
      coding.desktop
      restic.desktop
      prometheus.desktop
    ]
    ++ [
      desktop
      (cell.lib.mkHome "guangtao" "desktop" "zsh" "22.11")
      cell.userProfiles.root
    ]
    ++ inputs.cells.secrets.nixosSuites.full;

  libvirtd = with nixosProfiles;
    [
      (default {boot = "boot";})
      inputs.cells.secrets.nixosProfiles.age
    ]
    ++ [
      virtualization
    ]
    ++ [
      cell.userProfiles.root
      (cell.lib.mkHome "admin" "libvirtd_1" "zsh" "22.11")
    ];

  vultr = with nixosProfiles;
    inputs.cells.bootstrap.nixosSuites.cloud
    ++ [
      inputs.cells.secrets.nixosProfiles.age
      cell.nixosModules.chatgpt-web
      cell.nixosModules.chatgpt-web-yak
      cell.nixosModules.v2ray
      atticd.vultr
    ]
    ++ [
      cell.userProfiles.root
      (cell.lib.mkHome "admin" "vultr" "zsh" "22.11")
    ];
}
