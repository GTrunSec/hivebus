{
  lib,
  config,
  inputs,
  pkgs,
}@args: {
  _imports = [
    (lib.mkIf config.hive.bootstrap
      ((inputs.cells.nixos.profiles.default.addInputs args)
        .outputsForTarget "default")
      .bootstrap
      .default)
  ];
  # _options = with lib;
  #   lib.mkOption {
  #     type = types.submodule {
  #       options = {
  #         profiles = mkOption {
  #           type = types.attrs;
  #           default = {};
  #           description = "Hive profiles";
  #         };
  #         bootstrap = mkOption {
  #           type = types.bool;
  #           default = true;
  #           description = "Whether to enable bootstrap profile";
  #         };
  #       };
  #     };
  #   };
  #
  _options = {
    profiles = lib.mkOption {
      type = lib.types.attrs;
      default = {};
      description = "Hive profiles";
    };
  };
}
