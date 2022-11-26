{
  inputs,
  cell,
}: let
  l = nixpkgs.lib // builtins;
  inherit (inputs) nixpkgs std;
  withCategory = category: attrset: attrset // {inherit category;};
in
  l.mapAttrs (_: std.lib.dev.mkShell) {
    default = {
      extraModulesPath,
      pkgs,
      ...
    }: {
      name = "Apis Mellifera";
      std.docs.enable = false;
      git.hooks = {
        enable = true;
      };
      imports = [
        std.std.devshellProfiles.default
        "${extraModulesPath}/git/hooks.nix"
      ];

      nixago = [] ++ l.attrValues cell.nixago;

      commands = [
        {package = inputs.cells._docs.packages.styx;}
        (withCategory "hexagon" {package = cell.packages.colmena;})
        (withCategory "hexagon" {package = inputs.nixos-generators.packages.nixos-generate;})
        (withCategory "hexagon" {package = inputs.arion.packages.arion;})
        (withCategory "hexagon" {
          name = "build-larva";
          help = "the hive x86_64-linux iso-bootstrapper";
          command = ''
            nix build $PRJ_ROOT#x86_64-linux._QUEEN.nixosConfigurations.larva.config.system.build.isoImage
          '';
        })
      ];
      packages = [];
    };
  }