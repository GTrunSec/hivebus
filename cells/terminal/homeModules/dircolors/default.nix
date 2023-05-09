{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.dircolors = {
    enable = true;
    extraConfig = builtins.readFile ./LS_COLORS;
  };
}
