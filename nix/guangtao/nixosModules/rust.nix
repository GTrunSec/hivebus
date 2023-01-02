{
  pkgs,
  lib,
  ...
}: let
in {
  environment.systemPackages = with pkgs; [
    nil
  ];
}
