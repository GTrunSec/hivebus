{
  lib,
  config,
  inputs,
}: {
  #    292|       checkUnmatched =
  #    293|         if config._module.check && config._module.freeformType == null && merged.unmatchedDefns != [] then
  #       |         ^
  #    294|           let

  # (stack trace truncated; use '--show-trace' to show the full trace)

  # error: infinite recursion encountered

  # if config  # _imports = lib.optional config.hive.bootstrap [
  # ];
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
