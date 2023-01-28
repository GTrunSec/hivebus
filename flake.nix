{
  description = "The Hive - The secretly open NixOS-Society";

  inputs = {
    # std.url = "/home/guangtao/ghq/github.com/divnix/std";
    std.url = "github:divnix/std";
    std.inputs.nixpkgs.follows = "nixpkgs";
    std.inputs.arion.follows = "arion";
    std.inputs.microvm.follows = "microvm";
    dmerge.follows = "std/dmerge";

    cells-lab.url = "github:gtrunsec/cells-lab";
  };

  # tools
  inputs = {
    nix-filter.url = "github:/numtide/nix-filter";
    nixos-generators.url = "github:nix-community/nixos-generators";
    nixos-hardware.url = "github:nixos/nixos-hardware";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    impermanence.url = "github:nix-community/impermanence";
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
    nixpkgs-master.url = "github:nixos/nixpkgs";

    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    nixos.follows = "nixos-unstable";
    nixos-unstable.url = "github:nixos/nixpkgs/nixos-unstable-small";
    nixos-22-11.url = "github:nixos/nixpkgs/release-22.11";

    home-22-11.url = "github:nix-community/home-manager/release-22.11";
    home-22-11.inputs.nixpkgs.follows = "nixos-22-11";

    home.url = "github:nix-community/home-manager";
    home.inputs.nixpkgs.follows = "nixos";
  };

  # individual inputs
  inputs = {};

  outputs = {
    self,
    std,
    nixpkgs,
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
        (data "diskoConfigurations")
        (arion "arionConfigurations")
        (microvms "microvms")

        # devshells can be entered
        (devshells "devshells")

        # jobs can be run
        (runnables "entrypoints")

        # lib holds shared knowledge made code
        (functions "lib")
        (functions "config")
        (installables "packages" {ci.build = true;})
        (functions "overlays")

        # nixago part
        (nixago "nixago")

        # containers collection
        (containers "containers" {ci.publish = true;})
      ];
    }
    {
      devShells = inputs.std.harvest inputs.self ["automation" "devshells"];
      lib = (inputs.std.harvest inputs.self ["_QUEEN" "lib"]).x86_64-linux;
      overlays = (inputs.std.harvest inputs.self ["guangtao" "overlays"]).x86_64-linux;
      packages = inputs.std.harvest inputs.self [["guangtao" "packages"]];
    }
    # soil - the first (and only) layer implements adapters for tooling
    {
      # tools
      colmenaHive = self.lib.colmenaHive "colmenaConfigurations" self;
      nixosConfigurations = self.lib.nixosConfigurations "nixosConfigurations" self;
      homeConfigurations = self.lib.homeConfigurations "homeConfigurations" self;
      darwinConfigurations = self.lib.darwinConfigurations "darwinConfigurations" self;
      diskoConfigurations = self.lib.diskoConfigurations "diskoConfigurations" self;
    };
  # --- Flake Local Nix Configuration ----------------------------
  nixConfig = {
    extra-substituters = [
      "https://hyprland.cachix.org"
      "https://colmena.cachix.org"
      "https://nixpkgs-wayland.cachix.org"
      "https://cachix.org/api/v1/cache/emacs"
      "https://microvm.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "colmena.cachix.org-1:7BzpDnjjH8ki2CT3f6GdOk7QAzPOl+1t3LvTLXqYcSg="
      "emacs.cachix.org-1:b1SMJNLY/mZF6GxQE+eDBeps7WnkT0Po55TAyzwOxTY="
      "microvm.cachix.org-1:oXnBc6hRE3eX5rSYdRyMYXnfzcCxC7yKPTbZXALsqys="
    ];
  };
}
