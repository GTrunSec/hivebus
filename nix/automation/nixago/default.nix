{
  inputs,
  cell,
}: let
  inherit (inputs) std std-data-collection;

  l = inputs.nixpkgs.lib // builtins;
in {
  treefmt = std-data-collection.${inputs.nixpkgs.system}.data.configs.treefmt {
    data.formatter.prettier = {
      excludes = [
        "test/*"
        "generated.json"
      ];
    };
    data.formatter.nix = {
      excludes = ["generated.nix"];
    };
  };
  just = std.lib.cfg.just {
    data = {
      tasks = import ./justfile.nix {inherit inputs cell;};
    };
  };
}
