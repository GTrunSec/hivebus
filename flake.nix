{
  description = "The Hive - The secretly open NixOS-Society";

  inputs = {
    std.url = "github:divnix/std";
    std.inputs.nixpkgs.follows = "nixpkgs";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    cells-lab.url = "github:gtrunsec/cells-lab";
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
    std,
    nixpkgs,
    ...
  } @ inputs: let
    colmena = import ./lib/colmena.nix {inherit inputs;};
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

      cellBlocks = [
        # modules implement
        (std.blockTypes.functions "nixosModules")
        (std.blockTypes.functions "homeModules")
        (std.blockTypes.functions "devshellModules")

        # profiles activate
        (std.blockTypes.functions "nixosProfiles")
        (std.blockTypes.functions "homeProfiles")
        (std.blockTypes.functions "devshellProfiles")
        (std.blockTypes.functions "userProfiles")
        (std.blockTypes.functions "secretProfiles")

        # suites aggregate profiles
        (std.blockTypes.functions "nixosSuites")
        (std.blockTypes.functions "homeSuites")

        # configurations can be deployed
        (std.blockTypes.data "colmenaConfigurations")
        (std.blockTypes.data "homeConfigurations")

        # devshells can be entered
        (std.blockTypes.devshells "devshells")

        # jobs can be run
        (std.blockTypes.runnables "entrypoints")

        # lib holds shared knowledge made code
        (std.blockTypes.functions "lib")

        (std.blockTypes.functions "config")

        (std.blockTypes.functions "packages")

        (std.blockTypes.nixago "nixago")
      ];
    }
    {
      devShells = inputs.std.harvest inputs.self ["_automation" "devshells"];
    }
    # soil - the first (and only) layer implements adapters for tooling
    {
      # tool: colmena
      inherit colmena;
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
