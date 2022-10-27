{
  description = "The Hive - The secretly open NixOS-Society";

  inputs = {
    std.url = "github:divnix/std";
    std.inputs.nixpkgs.follows = "nixpkgs";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    cells-lab.url = "github:gtrunsec/cells-lab";

    hivelib.url = "github:divnix/hive";
    hivelib.flake = false;

    colmena.url = "github:zhaofengli/colmena";
    colmena.inputs.nixpkgs.follows = "nixpkgs";
  };

  # tools
  inputs = {
    nixos-generators.url = "github:nix-community/nixos-generators";
  };

  # nixpkgs & home-manager
  inputs = {
    nixpkgs-lock.follows = "nixpkgs";
    nixos.url = "github:nixos/nixpkgs/release-22.05";
    home.url = "github:nix-community/home-manager/release-22.05";
  };

  # individual inputs
  inputs = {};

  outputs = {
    self,
    std,
    nixpkgs,
    ...
  } @ inputs: let
    colmenaHive = let
      makeHoneyFrom = import "${inputs.hivelib}/make-honey.nix" {
        inherit (inputs) colmena nixpkgs;
        cellBlock = "colmenaConfigurations";
      };
    in
      makeHoneyFrom self;

    nixosConfigurations = let
      makeMeadFrom = import "${inputs.hivelib}/make-mead.nix" {
        inherit (inputs) nixpkgs;
        cellBlock = "nixosConfigurations";
      };
    in
      makeMeadFrom self;
  in
    std.growOn {
      inherit inputs;
      systems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];

      cellsFrom = ./comb;

      cellBlocks = with std.blockTypes; [
        # modules implement
        (functions "nixosModules")
        (functions "homeModules")
        (functions "devshellModules")

        # profiles activate
        (functions "nixosProfiles")
        (functions "homeProfiles")
        (functions "devshellProfiles")
        (functions "userProfiles")
        (functions "secretProfiles")

        # suites aggregate profiles
        (functions "nixosSuites")
        (functions "homeSuites")

        # configurations can be deployed
        (data "colmenaConfigurations")
        (data "homeConfigurations")

        # devshells can be entered
        (devshells "devshells")

        # jobs can be run
        (runnables "entrypoints")

        # lib holds shared knowledge made code
        (functions "lib")

        (functions "config")

        (functions "packages")

        (nixago "nixago")
      ];
    }
    {
      devShells = inputs.std.harvest inputs.self ["_automation" "devshells"];
    }
    # soil - the first (and only) layer implements adapters for tooling
    {
      # tool: colmena
      inherit colmenaHive nixosConfigurations;
    }
    {
      # --- Flake Local Nix Configuration ----------------------------
      # TODO: adopt spongix
      nixConfig = {
        extra-substituters = [];
        extra-trusted-public-keys = [];
      };
    };
}
