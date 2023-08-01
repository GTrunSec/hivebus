_:
{ config, lib, ... }:
{
  programs.direnv = {
    enable = true;
    enableZshIntegration = lib.mkIf config.programs.zsh.enable true;
    nix-direnv = {
      enable = true;
    };
  };
}
