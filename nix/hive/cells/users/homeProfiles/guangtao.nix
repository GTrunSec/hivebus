_:
{config, lib, ...}:
with lib; {
  programs.navi = mkIf config.programs.navi.enable {
    settings = {
      cheats = {
        paths = ["~/ghq/github.com/GTrunSec/hive/profiles/navi"];
      };
    };
  };
  programs.git = mkIf config.programs.git.enable {
    userEmail = "gtrunsec@hardenedlinux.org";
    userName = "guangtao";
    ignores = [
      ".projectile"
      ".indium.json"
      ".ccls-cache"
      ".Rhistory"
      ".notdeft*"
      "eaf"
      ".cache"
      ".org-src-babel"
      ".auctex-auto"
      "vast.db"
      ".DS_Store"
      "result"
      ".ipynb_checkpoints"
      "__pycache__"
      "*.org.organice-bak"
      ".direnv"
      ".direnv.d"
      ".secrets"
      ".cargo"
    ];
  };
}
