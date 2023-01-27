{
  inputs,
  cell,
}: let
  inherit (inputs.std.lib.ops) mkMicrovm;
in {
  # std //guangtao/microvms/dev:run
  dev = mkMicrovm {
    imports = [
      cell.nixosModules.microvm
      cell.microvmProfiles.dev
      {nixpkgs.pkgs = cell.nixosConfigurations.desktop.bee.pkgs;}
    ];
  };
}
