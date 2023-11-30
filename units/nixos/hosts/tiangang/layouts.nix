{
  inputs,
  outputs,
  lib,
  self,
}:
let
  outputs = inputs.self;
in
{
  system = "x86_64-linux";

  data = outputs.local.${self.system}.data;

  hive = {
    bee.system = self.system;
    bee.pkgs = import inputs.nixpkgs { inherit (self) system; };
    imports = lib.flatten self.nixosSuites;
  };

  nixosSuites = lib.flatten [
    outputs.hosts.tiangang.nixosProfiles.bootstrap
    # outputs.nixosProfiles.presets.bootstrap
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
