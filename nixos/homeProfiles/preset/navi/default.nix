_: {
  config,
  lib,
  ...
}: {
  programs.navi = {
    enable = true;
    enableZshIntegration = lib.mkIf config.programs.zsh.enable true;
    settings = {
      cheats = {};
    };
  };
}
