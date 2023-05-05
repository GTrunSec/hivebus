{
  lib,
  config,
  inputs,
  pkgs',
}: {
  _imports = [
    (lib.mkIf config.hive.bootstrap
      ((inputs.cells.nixos.profiles.default.addInputs {inherit config pkgs';})
        .outputsForTarget "default")
      .bootstrap
      .default)
  ];
  _options = with lib;
    lib.mkOption {
      type = types.submodule {
        options = {
          bootstrap = mkOption {
            type = types.bool;
            default = true;
            description = "Whether to enable bootstrap profile";
          };
        };
      };
    };
}
