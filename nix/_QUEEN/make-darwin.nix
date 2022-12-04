{
  nixpkgs,
  darwin,
  cellBlock ? "darwinConfigurations",
  pasteurize',
}: let
  l = nixpkgs.lib // builtins;
  inherit (import pasteurize' {inherit nixpkgs cellBlock;}) cure beeOptions;
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
        system = config.bee.system;
      };
  in
    l.mapAttrs (evalNode {}) comb
