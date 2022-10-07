{
  inputs,
  cell,
}: let
  inherit (inputs) nixos-generators nixos;
  inherit (cell) nixosProfiles lib;
in
  builtins.mapAttrs (lib.lay nixos.legacyPackages.x86_64-linux) {
    larva = {
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
