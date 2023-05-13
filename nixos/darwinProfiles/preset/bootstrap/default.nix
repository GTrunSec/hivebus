{nixosModulesPath}: {
  pkgs,
  config,
  lib,
  ...
}: let
  l = lib // builtins;
in {
  # options.hive.env = (import (nixosModulesPath + "/hive/env.nix") {inherit lib;})._options;
  # hive.env.PATH = l.concatStringsSep ":" [
  #   "/run/current-system/sw/bin"
  #   "/run/current-system/etc/profiles/per-user/$USER/bin"
  #   "/opt/homebrew/bin"
  #   "/bin/"
  #   "/usr/bin"
  #   "/usr/bin/sbin"
  # ];
  environment.systemPath = [];
  environment.variables = {
    # PATH = config.hive.env.PATH;
    PATH = l.concatStringsSep ":" [
      "/run/current-system/sw/bin"
      "/run/current-system/etc/profiles/per-user/$USER/bin"
      "/opt/homebrew/bin"
      "/bin/"
      "/usr/bin"
      "/usr/bin/sbin"
    ];
  };
}
