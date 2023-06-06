_: {
  config,
  lib,
  ...
}: {
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = lib.mkIf config.programs.zsh.enable true;
  };
}
