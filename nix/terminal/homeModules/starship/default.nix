{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    settings = lib.importTOML ./starship.toml;
  };
}
