{
  config,
  pkgs,
  lib,
  inputs,
  mkModulePath,
  ...
}:
let
  cfg = config.services.atticd;
in
{
  imports = [ inputs.attic.nixosModules.atticd ];
  options = with lib; {
    __profiles__ = mkOption {
      default = { };
      type = types.submodule {
        options = {
          psql = mkEnableOption (lib.mdDoc "Whether to enable psql");
        };
      };
    };
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.enable (
      mkModulePath {
        settings = {
          compression = {
            type = "zstd";
            level = 12;
          };
          chunking = {
            nar-size-threshold = 131072;
            min-size = 65536;
            avg-size = 131072;
            max-size = 262144;
          };
          garbage-collection.default-retention-period = "3 months";
        };
      }
    ))
    (lib.mkIf cfg.__profiles__.psql {
      services.postgresql.enable = true;
      services.postgresql.ensureDatabases = [ "atticd" ];
      services.postgresql.ensureUsers = [
        {
          name = "atticd";
          ensureDBOwnership = true;
          ensurePermissions."DATABASE atticd" = "ALL PRIVILEGES";
        }
      ];
    })
  ];
}
