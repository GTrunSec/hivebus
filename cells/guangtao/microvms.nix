{
  inputs,
  cell,
}: let
  inherit (inputs.std.lib.ops) mkMicrovm;
  nixos = import inputs.nixos-22-11 {
    inherit (inputs.nixpkgs) system;
  };
in {
  # std //guangtao/microvms/dev:run
  dev = mkMicrovm {
    imports = [
      cell.nixosModules.microvm
      cell.microvmProfiles.dev
      {nixpkgs.pkgs = cell.nixosConfigurations.desktop.bee.pkgs;}
    ];
    config.documentation.enable = false;
  };
}
