{ inputs, cell }:
let
  l = nixpkgs.lib // builtins;
  inherit (inputs) nixpkgs std;
  inherit (std) lib;
  withCategory = category: attrset: attrset // { inherit category; };
in
l.mapAttrs (_: std.lib.dev.mkShell) {
  default =
    { extraModulesPath, pkgs, ... }:
    {
      name = "Apis Mellifera";
      git.hooks = {
        enable = true;
      };
      imports = [
        std.std.devshellProfiles.default
        # inputs.cells.bootstrap.devshellProfiles.secureboot
        "${extraModulesPath}/git/hooks.nix"
      ] ++ l.optionals nixpkgs.stdenv.isLinux [ cell.devshellProfiles.terraform ];

      nixago = [
        # (lib.dev.mkNixago std.lib.cfg.just cell.configs.just)
        cell.configs.treefmt.default
      ];

      commands =
        [
          (withCategory "hexagon" { package = cell.packages.colmena; })
          # (withCategory "hexagon" { package = __inputs__.arion.packages.arion; })
          (withCategory "secrets" {
            package =
              inputs.hivebus.subflake.inputs.ragenix.packages.${nixpkgs.system}.ragenix
              // {
                meta.description = "age-encrypted secrets for NixOS; drop-in replacement for agenix";
              };
          })
          (withCategory "secrets" { package = nixpkgs.sops; })
        ]
        ++ l.optionals nixpkgs.stdenv.isLinux [
          (withCategory "hexagon" {
            package = inputs.nixos-generators.packages.${nixpkgs.system}.nixos-generate;
          })
        ];
      packages = [ ];
    };
}
