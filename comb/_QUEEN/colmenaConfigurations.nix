{
  inputs,
  cell,
}: let
  inherit (inputs) nixos-generators nixos;
  inherit (cell) nixosProfiles lib;
in {
  larva = {
    bee = {
      pkgs = nixos.legacyPackages;
      system = "x86_64-linux";
    };
    deployment = {
      targetHost = "fe80::47";
      targetPort = 22;
      targetUser = "root";
    };
    imports = [
      nixos-generators.nixosModules.install-iso
      nixosProfiles.bootstrap
    ];
  };
}
