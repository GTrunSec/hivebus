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
    nixos.follows = "nixos-21-11";
    home.follows = "home-21-11";

    nixos-21-11.url = "github:nixos/nixpkgs/release-21.11";
    home-21-11.url = "github:blaggacao/home-manager/release-21.11-with-nix-profile";
  };

  # individual inputs
  inputs = {
    iog-patched-nix.url = "github:kreisys/nix/goodnix-maybe-dont-functor";
  };

  outputs = {
    std,
    nixpkgs,
    ...
  } @ inputs: let
    # exports have no system, pick one
    exports = inputs.self.x86_64-linux;
    colmena = import ./lib/colmena.nix {inherit inputs exports;};
  in
    std.growOn {
      inherit inputs;

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

        # suites aggregate profiles
        (std.blockTypes.functions "nixosSuites")
        (std.blockTypes.functions "homeSuites")

        # configurations can be deployed
        (std.blockTypes.data "colmenaConfigurations")
        (std.blockTypes.data "homeConfigurations")

        # devshells can be entered
        (std.blockTypes.devshells "devshells")

        # jobs can be run
        (std.blockTypes.runnables "jobs")

        # lib holds shared knowledge made code
        (std.blockTypes.functions "lib")

        (std.blockTypes.nixago "nixago")
      ];
    }
    {
      devShells = inputs.std.harvest inputs.self ["main" "devshells"];
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
  # --------------------------------------------------------------
}
