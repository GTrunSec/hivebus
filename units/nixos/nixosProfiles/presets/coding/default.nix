_:
{
  pkgs,
  lib,
  config,
  ...
}:
{
  config =
    with lib; mkMerge [ { environment.systemPackages = with pkgs; [ just ]; } ];
}
