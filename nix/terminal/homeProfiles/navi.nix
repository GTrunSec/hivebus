{
  inputs,
  cell,
}: rec {
  default = {
    programs.navi = {
      enable = true;
    };
  };
  guangtao = {
    imports = [default];
    programs.navi = {
      enableZshIntegration = true;
      settings = {
        cheats = {
          paths = [
            "~/ghq/github.com/GTrunSec/hive/profiles/navi"
          ];
        };
      };
    };
  };
}
