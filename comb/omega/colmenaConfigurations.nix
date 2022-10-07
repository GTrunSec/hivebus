{
  inputs,
  cell,
}: let
  inherit (inputs) nixos;
  inherit (inputs.cells) _QUEEN;
in
  builtins.mapAttrs (_QUEEN.lib.lay nixos.legacyPackages.x86_64-linux) {
    blacklion = {
      imports = [
        cell.nixosProfiles.default
        ./colmenaConfigurations/blacklion
      ];
    };
  }
