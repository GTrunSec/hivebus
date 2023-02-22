{
  inputs,
  cell,
}: let
  init = {
    pkgs,
    config,
    ...
  }: {
    # system.build.applications = pkgs.lib.mkForce (
    #   pkgs.buildEnv {
    #     name = "applications";
    #     paths = config.environment.systemPackages ++ config.home-manager.users."gtrun".home.packages;
    #     pathsToLink = "/Applications";
    #   }
    # );
  };
in rec {
  bee.system = "aarch64-darwin";
  bee.home = inputs.home;
  bee.pkgs = import inputs.nixos-22-11 {
    inherit (bee) system;
    config.allowUnfree = true;
    config.allowBroken = true;
    overlays = cell.overlays.macbook;
  };
  imports =
    [
      init
    ]
    ++ [
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
      }
    ]
    ++ cell.darwinSuites.macbook;
}
