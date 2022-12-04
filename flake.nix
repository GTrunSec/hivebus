{
  description = "The Hive - The secretly open NixOS-Society";

  inputs = {
    # std.url = "/home/gtrun/ghq/github.com/divnix/std";
    std.url = "github:divnix/std";
    std.inputs.nixpkgs.follows = "nixpkgs";
    std.inputs.arion.follows = "arion";
    std.inputs.microvm.follows = "microvm";

    hivelib.url = "github:divnix/hive";
    hivelib.inputs.nixpkgs.follows = "nixpkgs";
    hivelib.inputs.colmena.follows = "colmena";
    hivelib.inputs.nixos-hardware.follows = "nixos-hardware";
    # hivelib.url = "/home/gtrun/ghq/github.com/divnix/hive-1";
    cells-lab.url = "github:gtrunsec/cells-lab";
  };

  # tools
  inputs = {
    nixos-generators.url = "github:nix-community/nixos-generators";
    nixos-hardware.url = "github:nixos/nixos-hardware";
    disko.follows = "hivelib/disko";

    # nixos-generators.follows = "hivelib/nixos-generators";
    colmena.url = "github:zhaofengli/colmena";
    colmena.inputs.nixpkgs.follows = "nixpkgs";

    microvm.url = "github:astro/microvm.nix";

    arion.url = "github:hercules-ci/arion";
    arion.inputs.nixpkgs.follows = "nixpkgs";
  };

  # nixpkgs & home-manager
  inputs = {
    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixos.url = "github:nixos/nixpkgs/release-22.11";

    home.url = "github:nix-community/home-manager/release-22.11";
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

      cellsFrom = ./nix;

      cellBlocks = with std.blockTypes; [
        # modules implement
        (functions "nixosModules")
        (functions "darwinModules")
        (functions "homeModules")
        (functions "devshellModules")

        # profiles activate
        (functions "nixosProfiles")
        (functions "darwinProfiles")
        (functions "homeProfiles")
        (functions "devshellProfiles")
        (functions "userProfiles")
        (functions "secretProfiles")
        (functions "arionProfiles")
        (functions "microvmProfiles")

        # suites aggregate profiles
        (functions "nixosSuites")
        (functions "darwinSuites")
        (functions "homeSuites")

        # configurations can be deployed
        (data "colmenaConfigurations")
        (data "homeConfigurations")
        (data "nixosConfigurations")
        (data "darwinConfigurations")
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
      devShells = inputs.std.harvest inputs.self ["automation" "devshells"];
      lib = (inputs.std.harvest inputs.self ["_QUEEN" "lib"]).x86_64-linux;
    }
    # soil - the first (and only) layer implements adapters for tooling
    {
      # tools
      colmenaHive = self.lib.colmenaHive "colmenaConfigurations" self;
      nixosConfigurations = self.lib.nixosConfigurations "nixosConfigurations" self;
      homeConfigurations = self.lib.homeConfigurations "homeConfigurations" self;
      darwinConfigurations = self.lib.darwinConfigurations "darwinConfigurations" self;
    }
    {
      # --- Flake Local Nix Configuration ----------------------------
      nixConfig = {
        extra-substituters = [
          "https://hyprland.cachix.org"
          "https://colmena.cachix.org"
          "https://nixpkgs-wayland.cachix.org"
        ];
        extra-trusted-public-keys = [
          "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
          "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
          "colmena.cachix.org-1:7BzpDnjjH8ki2CT3f6GdOk7QAzPOl+1t3LvTLXqYcSg="
        ];
      };
    };
}
