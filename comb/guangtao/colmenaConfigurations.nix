{
  inputs,
  cell,
}: let
  inherit (inputs) nixos;
  inherit (inputs.cells) _QUEEN;

  l = inputs.nixpkgs.lib // builtins;
in
  builtins.mapAttrs (_QUEEN.lib.lay nixos.legacyPackages.x86_64-linux) {
    home = {
      imports = [
        ../omega/colmenaConfigurations/blacklion
        inputs.home.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users."${l.baseNameOf ./.}" = {
            imports = cell.homeSuites.shell;
          };
        }
        cell.userProfiles.default
      ];
    };
  }
