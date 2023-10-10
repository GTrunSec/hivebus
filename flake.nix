{
  description = "The Hive - The secretly open NixOS-Society";

  inputs = {
    # std.url = "/home/guangtao/ghq/github.com/divnix/std";
    std-ext.url = "github:gtrunsec/std-ext";
    std-ext.inputs.std.follows = "std";
    std-ext.inputs.flops.follows = "flops";
    std.url = "github:divnix/std";
    std.inputs.devshell.follows = "std-ext/devshell";
    std.inputs.nixago.follows = "std-ext/nixago";
    std.inputs.arion.follows = "arion";

    hive.url = "github:divnix/hive";
    hive.inputs.haumea.follows = "flops/haumea";
    # hive.url = "/home/guangtao/ghq/github.com/divnix/hive";
    # flops.url = "/home/guangtao/ghq/github.com/GTrunSec/flops";
    flops.url = "github:gtrunsec/flops";
    haumea.follows = "flops/haumea";
    omnibus.url = "github:gtrunsec/omnibus";
  };
  inputs.hive.inputs = {
    nixos-generators.follows = "nixos-generators";
    colmena.follows = "colmena";
    disko.follows = "disko";
  };
  # tools
  inputs = {
    nix-filter.url = "github:numtide/nix-filter";
    nixos-generators.url = "github:nix-community/nixos-generators";
    nixos-hardware.url = "github:nixos/nixos-hardware";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    colmena.url = "github:zhaofengli/colmena";
    colmena.inputs.nixpkgs.follows = "nixpkgs";

    microvm.url = "github:astro/microvm.nix";

    arion.url = "github:hercules-ci/arion";
    arion.inputs.nixpkgs.follows = "nixpkgs";

    srvos.url = "github:numtide/srvos";
    srvos.inputs.nixpkgs.follows = "nixpkgs";
  };

  # nixpkgs & home-manager
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs";

    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    nixos.follows = "nixos-unstable";
    darwin-unstable.url = "github:nixos/nixpkgs/nixos-unstable-small";
    nixos-unstable.url = "github:nixos/nixpkgs/nixos-unstable-small";

    nixos-23-05.url = "github:nixos/nixpkgs/release-23.05";

    home-23-05.url = "github:nix-community/home-manager/release-23.05";
    home-23-05.inputs.nixpkgs.follows = "nixos-23-05";

    home.url = "github:nix-community/home-manager";
    home.inputs.nixpkgs.follows = "nixos";
  };

  # individual inputs
  # use callInputs instead, for the subflake
  inputs = { };

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
        inherit inputs;
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
            (devshells "devshells")

            # jobs can be run
            (runnables "entrypoints")
            (functions "apps")

            # lib holds shared knowledge made code
            (functions "lib")
            (data "data")
            (functions "configs")
            (installables "packages" { ci.build = true; })
            (functions "overlays")

            # nixago part
            (nixago "nixago")

            # containers collection
            (containers "containers" { ci.publish = true; })
          ];
      }
      {
        devShells = std.harvest inputs.self [ [
          "automation"
          "devshells"
        ] ];
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
        packages = std.harvest inputs.self [ [
          "nixos"
          "packages"
        ] ];
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
    ];
    extra-trusted-public-keys = [
      "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "colmena.cachix.org-1:7BzpDnjjH8ki2CT3f6GdOk7QAzPOl+1t3LvTLXqYcSg="
      "microvm.cachix.org-1:oXnBc6hRE3eX5rSYdRyMYXnfzcCxC7yKPTbZXALsqys="
    ];
  };
}
