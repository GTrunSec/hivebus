{
  inputs,
  cell,
}: let
  inherit (inputs) nixos;
  inherit (inputs.cells) _QUEEN;

  l = inputs.nixpkgs.lib // builtins;
in {
  home = {
    bee = rec {
      pkgs = import inputs.nixos {
        config = {
          allowUnfree = true;
        };
        inherit system;
      };
      system = "x86_64-linux";
    };

    imports = [
      ./nixosConfigurations/blacklion
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
