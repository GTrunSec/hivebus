{
  inputs,
  cell,
}: let
  inherit (cell) nixosSuites;
  l = inputs.nixpkgs.lib // builtins;
in {
  desktop = rec {
    bee.system = "x86_64-linux";
    bee.home = inputs.home;
    bee.pkgs = import inputs.nixos {
      inherit (inputs.nixpkgs) system;
      config.allowUnfree = true;
      overlays = [];
    };
    imports = [
      bee.home.nixosModules.home-manager
      ./nixosConfigurations/desktop
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.guangtao = {
          inherit (cell.homeConfigurations.guangtao) imports;
        };
      }
      cell.userProfiles.default
      inputs.cells._input.nixosModules.fcitx5
    ];
  };
}
