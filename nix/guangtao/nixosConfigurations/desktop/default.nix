{
  inputs,
  cell,
}: rec {
  bee.system = "x86_64-linux";
  bee.home = inputs.home;
  bee.pkgs = import inputs.nixos {
    inherit (inputs.nixpkgs) system;
    config.allowUnfree = true;
    overlays = cell.overlays.desktop;
  };
  imports =
    [
      ./hardware-configuration.nix
      bee.home.nixosModules.home-manager
    ]
    ++ [
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
      }
    ]
    ++ cell.nixosSuites.desktop;
}
