_:
{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [ just ];
}
