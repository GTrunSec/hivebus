_: {
  config,
  lib,
  pkgs,
  ...
}: {
  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = lib.mkIf config.programs.zsh.enable true;
  };
}
