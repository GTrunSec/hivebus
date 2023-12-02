{
  description = "The Hive - The secretly open NixOS-Society";

  inputs = {
    std = {
      url = "github:divnix/std";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.devshell.follows = "devshell";
      inputs.nixago.follows = "nixago";
      inputs.arion.follows = "arion";
    };

    nixago = {
      url = "github:nix-community/nixago";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixago-exts.follows = "";
    };

    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    haumea.follows = "std/haumea";

    hive.url = "github:divnix/hive";
    # hive.url = "/home/guangtao/ghq/github.com/divnix/hive";
  };
  inputs.hive.inputs = {
    colmena.follows = "colmena";
  };
  # tools
  inputs = {
    nix-filter.url = "github:numtide/nix-filter";
    nixos-generators.url = "github:nix-community/nixos-generators";
    nixos-hardware.url = "github:nixos/nixos-hardware";

    colmena.url = "github:zhaofengli/colmena";
    microvm.url = "github:astro/microvm.nix";

    arion.url = "github:hercules-ci/arion";
    arion.inputs.nixpkgs.follows = "nixpkgs";
  };

  # nixpkgs & home-manager
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  # use callInputs instead, for the subflake
  inputs = {
    call-flake.url = "github:divnix/call-flake";
  };

  outputs =
    {
      self,
      std,
      nixpkgs,
      hive,
      ...
    }@inputs:
    std.growOn
      {
        inputs = inputs // {
          hivebus = inputs.call-flake ../..;
        };
        nixpkgsConfig = {
          allowUnfree = true;
        };
        systems = [
          "aarch64-darwin"
          "aarch64-linux"
          "x86_64-darwin"
          "x86_64-linux"
        ];

        cellsFrom = ./cells;

        cellBlocks =
          with std.blockTypes;
          with hive.blockTypes; [
            # modules implement
            (functions "nixosModules")
            (functions "darwinModules")
            (functions "homeModules")
            (functions "devshellModules")

            # profiles activate
            (functions "pops")
            (functions "exporter")
            (functions "nixosProfiles")
            (functions "darwinProfiles")
            (functions "hardwareProfiles")
            (functions "homeProfiles")
            (functions "devshellProfiles")
            (functions "userProfiles")
            (functions "arionProfiles")
            (functions "microvmProfiles")
            # configurations can be deployed
            colmenaConfigurations
            homeConfigurations
            nixosConfigurations
            diskoConfigurations
            darwinConfigurations

            (arion "arionConfigurations")
            (microvms "microvms")

            # devshells can be entered
            (devshells "shells")

            # jobs can be run
            (runnables "entrypoints")
            (functions "apps")

            # lib holds shared knowledge made code
            (functions "lib")
            (data "data")
            (functions "configs")
            (installables "packages" {ci.build = true;})
            (functions "overlays")

            # nixago part
            (nixago "nixago")

            # containers collection
            (containers "containers" {ci.publish = true;})
          ];
      }
      {
        devShells = std.harvest inputs.self [
          [
            "repo"
            "shells"
          ]
        ];
        lib =
          (std.harvest inputs.self [
            "hosts"
            "lib"
          ]).x86_64-linux
          // {
            inherit (hive) collect;
          };
        overlays =
          (std.harvest inputs.self [
            "nixos"
            "pops"
          ]).x86_64-linux.exports.overlays;
        nixosModules =
          (std.harvest inputs.self [
            "nixos"
            "pops"
          ]).x86_64-linux.exports.nixosModules.outputs;
        # apps = std.harvest inputs.self [["emacs" "apps"]];
      }
      # soil - the first (and only) layer implements adapters for tooling
      {
        # tools
        colmenaHive = hive.collect self "colmenaConfigurations";
        nixosConfigurations = hive.collect self "nixosConfigurations";
        homeConfigurations = hive.collect self "homeConfigurations";
        darwinConfigurations = hive.collect self "darwinConfigurations";
        diskoConfigurations = hive.collect self "diskoConfigurations";
      };
  # --- Flake Local Nix Configuration ----------------------------
  nixConfig = {
    extra-substituters = [
      "https://hyprland.cachix.org"
      "https://colmena.cachix.org"
      "https://nixpkgs-wayland.cachix.org"
      "https://cachix.org/api/v1/cache/emacs"
      "https://microvm.cachix.org"
      "https://tweag-topiary.cachix.org"
      "https://tweag-nickel.cachix.org"
      "https://organist.cachix.org"
    ];
    extra-trusted-public-keys = [
      "tweag-topiary.cachix.org-1:8TKqya43LAfj4qNHnljLpuBnxAY/YwEBfzo3kzXxNY0="
      "tweag-nickel.cachix.org-1:GIthuiK4LRgnW64ALYEoioVUQBWs0jexyoYVeLDBwRA="
      "organist.cachix.org-1:GB9gOx3rbGl7YEh6DwOscD1+E/Gc5ZCnzqwObNH2Faw="
      "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "colmena.cachix.org-1:7BzpDnjjH8ki2CT3f6GdOk7QAzPOl+1t3LvTLXqYcSg="
      "microvm.cachix.org-1:oXnBc6hRE3eX5rSYdRyMYXnfzcCxC7yKPTbZXALsqys="
    ];
  };
}
