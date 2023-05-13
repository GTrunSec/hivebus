_: {
  config,
  lib,
  ...
}: {
  config = with lib;
    mkMerge [
      {
        programs.navi = {
          settings = {
            cheats = {
              paths = [
                "~/ghq/github.com/GTrunSec/hive/profiles/navi"
              ];
            };
          };
        };
      }
      {
        programs.git = {
          userEmail = "gtrunsec@hardenedlinux.org";
          userName = "guangtao";
        };
      }
    ];
}
