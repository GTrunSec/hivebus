{
  lib,
  config,
  inputs,
}: {
  # _imports = lib.optional config.hive.bootstrap [
  #];
  _imports = [
    (inputs.cells.nixos.nixosProfiles.default.outputsForTarget "default").bootstrap.default
  ];
  _options = with lib;
    mkOption {
      default = {};
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
