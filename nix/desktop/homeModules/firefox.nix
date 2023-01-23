{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.firefox = {
    enable = true;
  };
}
