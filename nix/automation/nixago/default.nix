{
  inputs,
  cell,
}: let
  inherit (inputs) std;
in {
  treefmt = std.presets.nixago.treefmt {
    configData.formatter.prettier = {
      excludes = [
        "test/*"
        "generated.json"
      ];
    };
    configData.formatter.nix = {
      excludes = ["generated.nix"];
    };
  };
  just = std.std.nixago.just {
    configData = {
      tasks = import ./tasks.nix;
    };
  };
}
