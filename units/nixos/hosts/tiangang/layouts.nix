{
  inputs,
  outputs,
  lib,
  self,
  omnibus,
}:
let
  inherit (omnibus.lib) mapLoadToPops mapPopsExports';
  outputs = mapPopsExports' (
    mapLoadToPops inputs.self.pops (
      n: v: {
        load.inputs = {
          inputs =
            ((inputs.self.pops.subflake.setSystem self.system).addInputsExtender {
              inputs.local.data = inputs.self.local.${self.system}.data;
            }).inputs;
        };
      }
    )
  );
in
{
  system = "x86_64-linux";

  data = inputs.self.local.${self.system}.data;

  hive = {
    bee.system = self.system;
    bee.pkgs = import inputs.nixos-unstable {
      inherit (self) system;
      overlays = [
        (_: prev: {dhcpcd = prev.dhcpcd.override {enablePrivSep = false;};})
      ];
    };
    imports = lib.flatten self.nixosSuites;
  };

  nixosSuites = lib.flatten [
    {
      environment.memoryAllocator.provider = "mimalloc";
      # nixpkgs.overlays = [];
    }

    # outputs.hosts.tiangang.nixosProfiles.default.bootstrap
    outputs.hosts.tiangang.nixosProfiles.exportModulesRecursive
    outputs.nixosProfiles.default.presets.users.root
    outputs.omnibus.nixosProfiles.default.cloud.contabo

    outputs.omnibus.nixosProfiles.default.presets.secrets.ragenix
    # outputs.nixosModules.default.programs.git

    # # # --custom profiles

    # outputs.srvos.default.common.nix
    # (outputs.omnibus.self.mkHome inputs.home.nixosModule
    #   {
    #     admin = {
    #       uid = 1000;
    #       description = "default manager";
    #       isNormalUser = true;
    #       extraGroups = [ "wheel" ];
    #     };
    #   }
    #   "zsh"
    #   self.homeSuites
    # )
  ];

  homeSuites =
    [
      # outputs.homeProfiles.presets.bat
      # # # The parent directory of "presets" is categorized as a list type of "suites"
      # (outputs.homeProfiles.shell { }).default
    ];
}
