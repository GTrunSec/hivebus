{
  nixpkgs,
  darwin,
  cellBlock ? "darwinConfigurations",
}: let
  l = nixpkgs.lib // builtins;
  inherit (import ./pasteurize.nix {inherit nixpkgs cellBlock;}) cure beeOptions;
in
  self: let
    comb = cure self;
    evalNode = extra: name: config: let
    in
      darwin.lib.darwinSystem {
        modules =
          [
            extra
            config
            beeOptions
          ]
          ++ l.optionals (config.bee ? home) [
            config.bee.home.darwinModules.home-manager
          ];
        inherit (config.bee) system pkgs;
      };
  in
    l.mapAttrs (evalNode {}) comb
