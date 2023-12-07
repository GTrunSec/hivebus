{
  lib,
  self,
  inputs,
  omnibus,
}:
let
  inherit (omnibus.lib) mapLoadToPops mapPopsExports';
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

  hive = {
    bee.system = self.system;
    # bee.home = inputs.home-manager;
    bee.darwin = inputs.darwin;
    bee.pkgs = import inputs.darwin-nixos-unstable {
      inherit (self) system;
      config = {
        permittedInsecurePackages = [];
      };
      overlays = [
        (_: _: {
          playwright-driver =
            inputs.nixos-23-05.legacyPackages.${self.system}.playwright-driver;
        })
      ];
    };
    imports = lib.flatten self.darwinSuites;
  };

  darwinSuites = lib.flatten [
    outputs.omnibus.darwinProfiles.default.init.default
    outputs.darwinProfiles.default.presets.homebrew

    outputs.omnibus.nixosProfiles.default.dev.coding
    outputs.nixosProfiles.default.presets.coding.python

    outputs.omnibus.darwinProfiles.default.presets.sketchybar
    # --custom profiles
    # outputs.pops.nixosProfiles.layouts.customProfiles.presets.nix
    (
      {config, ...}:
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
    outputs.homeProfiles.default.presets.git
    outputs.homeProfiles.default.presets.emacs.doom
    outputs.homeProfiles.default.presets.emacs.packages
    outputs.omnibus.homeProfiles.default.presets.latex

    outputs.omnibus.homeProfiles.default.shell.full
    outputs.homeProfiles.default.shell.wezterm

    # outputs.homeProfiles.presets.bat
    # # # The parent directory of "presets" is categorized as a list type of "suites"
    # (outputs.homeProfiles.shell { }).default
  ];
}
