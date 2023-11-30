_:
{ config, lib, ... }:
{
  # https://github.com/Canop/broot
  programs.broot = {
    enable = true;
    enableZshIntegration = lib.mkIf config.programs.zsh.enable true;
  };
}
