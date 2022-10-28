{
  inputs,
  cell,
}: let
  inherit (inputs) nixos;
  inherit (inputs.cells) _QUEEN;

  l = inputs.nixpkgs.lib // builtins;
in {
  home = {
    bee = {
      pkgs = inputs.nixos.legacyPackages;
      system = "x86_64-linux";
      config = {
        nixpkgs.allowUnfree = true;
      };
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
