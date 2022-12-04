{
  config,
  lib,
  pkgs,
  ...
}: {
  nix = {
    package = pkgs.nixUnstable;
  };
}
