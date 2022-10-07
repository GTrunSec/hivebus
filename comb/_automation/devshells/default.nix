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

      nixago = [cell.nixago.treefmt cell.nixago.mdbook];

      commands = [
        {package = cell.packages.colmena;}
        # { # (withCategory "hexagon" {package = nixpkgs.colmena;})
        (withCategory "hexagon" {
          name = "build-larva";
          help = "the hive x86_64-linux iso-bootstrapper";
          command = ''
            nix build $PRJ_ROOT#x86_64-linux._QUEEN.nixosConfigurations.larva.config.system.build.isoImage
          '';
        })
      ];
      packages = [
      ];
    };
  }
