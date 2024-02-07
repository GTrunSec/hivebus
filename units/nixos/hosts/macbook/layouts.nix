{
  lib,
  self,
  inputs,
  omnibus,
}:
let
  inherit (omnibus.lib.omnibus) mapLoadToPops mapPopsExports';
  outputs = mapPopsExports' (
    mapLoadToPops inputs.self.pops (
      n: v: {
        load.inputs = {
          inputs = (inputs.self.pops.subflake.setSystem self.system).inputs;
        };
      }
    )
  );
in
{
  inherit outputs;

  system = "aarch64-darwin";

  data = inputs.self.local.${self.system}.data;

  colmena = {
    nixpkgs = self.hive.bee.pkgs;
    deployment = {
      allowLocalDeployment = true;
      targetHost = "127.0.0.1";
    };
    imports = lib.flatten self.darwinSuites;
  };

  hive = {
    bee.system = self.system;
    # bee.home = inputs.home-manager;
    bee.darwin = inputs.darwin;
    bee.pkgs = import inputs.darwin-nixos-unstable {
      inherit (self) system;
      config = {
        permittedInsecurePackages = [ ];
      };
      overlays = [
        (_: prev: {
          nushell = prev.nushell.overrideAttrs (
            old: rec {
              version = "nightly-2024-2-8";
              src = prev.fetchFromGitHub {
                owner = "nushell";
                repo = "nushell";
                rev = "366348dea0951760b5b4cff879393358ab2b2d14";
                hash = "sha256-/Gvptp+GqtDqg7XkWZ4S6Yd01+qTC62BltDDO1xpd+I=";
              };

              cargoDeps = prev.rustPlatform.importCargoLock {
                outputHashes = { };
                lockFile = "${src}/Cargo.lock";
              };
            }
          );
        })
      ];
    };
    imports = lib.flatten self.darwinSuites;
  };

  darwinSuites = lib.flatten [
    # self.hive.bee.darwin.darwinModules
    outputs.omnibus.darwinProfiles.default.init.default
    outputs.darwinProfiles.default.presets.homebrew

    outputs.omnibus.nixosProfiles.default.dev.coding
    outputs.nixosProfiles.default.presets.coding.python
    outputs.nixosProfiles.default.presets.coding.julia
    outputs.darwinProfiles.default.presets.fonts

    outputs.omnibus.darwinProfiles.default.presets.sketchybar

    # --custom profiles
    # outputs.nixosProfiles.layouts.customProfiles.presets.nix
    (
      { config, ... }:
      {
        programs.zsh = {
          enable = true;
          variables = {
            PATH = "${config.omnibus.bootstrap.PATH}";
          };
        };
      }
    )
    (outputs.omnibus.self.default.mkHome inputs.home.darwinModule
      {
        guangtao = {
          uid = 1000;
          description = "Guangtao's home";
        };
      }
      "nushell"
      self.homeSuites
    )
  ];

  homeSuites = [
    outputs.hosts.macbook.homeProfiles.exportModulesRecursive
    outputs.homeProfiles.default.presets.git
    outputs.homeProfiles.default.apps.doomemacs-macbook
    outputs.omnibus.homeProfiles.default.presets.latex

    outputs.omnibus.homeProfiles.macbook.shell.full
    outputs.homeProfiles.default.shell.wezterm

    # outputs.homeProfiles.presets.bat
    # # # The parent directory of "presets" is categorized as a list type of "suites"
    # (outputs.homeProfiles.shell { }).default
  ];
}
