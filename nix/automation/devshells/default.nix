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
        inputs.cells.bootstrap.devshellProfiles.secureboot
        "${extraModulesPath}/git/hooks.nix"
      ];

      nixago = [] ++ l.attrValues cell.nixago;

      commands = [
        (withCategory "hexagon" {package = cell.packages.colmena;})
        (withCategory "hexagon" {package = inputs.nixos-generators.packages.${nixpkgs.system}.nixos-generate;})
        (withCategory "hexagon" {package = inputs.arion.packages.arion;})
        (withCategory "secrets" {
          package =
            inputs.cells.secrets.packages.ragenix
            // {
              meta.description = "age-encrypted secrets for NixOS; drop-in replacement for agenix";
            };
        })
        (withCategory "hexagon" {
          name = "build-larva";
          help = "the hive x86_64-linux iso-bootstrapper";
          command = ''
            nix build $PRJ_ROOT#x86_64-linux._QUEEN.nixosConfigurations.larva.config.system.build.isoImage
          '';
        })
      ];
      packages = [
        inputs.cells.desktop.packages.swww
      ];
    };
  }
