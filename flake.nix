{
  description = "The Hive - The secretly open NixOS-Society";

  inputs = {
    # std.url = "/home/gtrun/ghq/github.com/divnix/std";
    std.url = "github:divnix/std";
    std.inputs.nixpkgs.follows = "nixpkgs";
    std.inputs.arion.follows = "arion";
    std.inputs.microvm.follows = "microvm";

    hivelib.url = "github:divnix/hive";
    hivelib.flake = false;
    # hivelib.url = "/home/gtrun/ghq/github.com/divnix/hive-1";
    cells-lab.url = "github:gtrunsec/cells-lab";
  };

  # tools
  inputs = {
    nixos-generators.url = "github:nix-community/nixos-generators";
    nixos-hardware.url = "github:nixos/nixos-hardware";

    # nixos-generators.follows = "hivelib/nixos-generators";
    colmena.url = "github:zhaofengli/colmena";
    colmena.inputs.nixpkgs.follows = "nixpkgs";

    microvm.url = "github:astro/microvm.nix";

    arion.url = "github:hercules-ci/arion";
    arion.inputs.nixpkgs.follows = "nixpkgs";
  };

  # nixpkgs & home-manager
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixos.url = "github:nixos/nixpkgs/release-22.05";

    home.url = "github:nix-community/home-manager/release-22.05";
    home.inputs.nixpkgs.follows = "nixos";
  };

  # individual inputs
  inputs = {};

  outputs = {
    self,
    std,
    nixpkgs,
    hivelib,
    ...
  } @ inputs:
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
        (functions "arionProfiles")
        (functions "microvmProfiles")

        # suites aggregate profiles
        (functions "nixosSuites")
        (functions "homeSuites")

        # configurations can be deployed
        (data "colmenaConfigurations")
        (data "homeConfigurations")
        (data "nixosConfigurations")
        (arion "arionComposes")

        # devshells can be entered
        (devshells "devshells")

        # jobs can be run
        (runnables "entrypoints")

        # lib holds shared knowledge made code
        (functions "lib")

        (functions "config")

        (functions "packages")

        (functions "overlays")

        (nixago "nixago")
      ];
    }
    {
      devShells = inputs.std.harvest inputs.self ["_automation" "devshells"];
      lib = (inputs.std.harvest inputs.self ["_QUEEN" "lib"]).x86_64-linux;
    }
    # soil - the first (and only) layer implements adapters for tooling
    {
      # tools
      colmenaHive = self.lib.colmenaHive "colmenaConfigurations" self;
      nixosConfigurations = self.lib.nixosConfigurations "nixosConfigurations" self;
      homeConfigurations = self.lib.homeConfigurations "homeConfigurations" self;
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
