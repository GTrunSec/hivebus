{nixosModulesPath}:
{
  pkgs,
  config,
  lib,
  ...
}:
let
  l = lib // builtins;
in
{
  options.hive.env =
    (import (nixosModulesPath + "/hive/env.nix") {inherit lib;})._options;
  config = {
    hive.env.PATH = lib.mkBefore [
      "/run/current-system/sw/bin"
      "/run/current-system/etc/profiles/per-user/$USER/bin"
      "/opt/homebrew/bin"
      "/bin/"
      "/usr/bin"
      "/usr/bin/sbin"
      "/usr/local/bin"
      "/usr/sbin"
      "/sbin"
    ];
    environment.systemPath = [];
    environment.variables.PATH = config.hive.env.PATH;
  };
}
