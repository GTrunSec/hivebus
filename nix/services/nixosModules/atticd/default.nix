{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg' = config.services.atticd.hiveProfiles;
  cfg = config.services.atticd;
in {
  options.services.atticd = with lib; {
    hiveProfiles = mkOption {
      default = {};
      type = types.submodule {
        options = {
          psql = mkEnableOption (lib.mdDoc "Whether to enable psql");
        };
      };
    };
  };

  imports = [./module.nix];

  config = lib.mkMerge [
    (
      lib.mkIf cfg.enable {
        services.atticd = {
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
        };
      }
    )
    (lib.mkIf cfg'.psql {
      services.postgresql.enable = true;
      services.postgresql.ensureDatabases = [
        "atticd"
      ];
      services.postgresql.ensureUsers = [
        {
          name = "atticd";
          ensurePermissions = {
            "DATABASE atticd" = "ALL PRIVILEGES";
          };
        }
      ];
    })
  ];
}
