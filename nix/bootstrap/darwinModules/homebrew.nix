{
  pkgs,
  config,
  lib,
  ...
}: let
  l = lib // builtins;
  inherit (pkgs.stdenv.hostPlatform) isAarch64;
  brewPrefix =
    if isAarch64
    then "/opt/homebrew"
    else "/usr/local";
in {
  # credit: https://github.com/montchr/dotfield/blob/dd5e577d91b1af7f13909f5dc4343717a718ff02/darwin/profiles/core/default.nix
  homebrew = {
    enable = true;
    # onActivation.cleanup = "zap";
    onActivation.upgrade = true;
    # Use the nix-darwin brewfile when invoking `brew bundle` imperatively.
    global.brewfile = true;
    global.lockfiles = false;
  };
  environment.systemPath = l.mkBefore ["${brewPrefix}/bin" "${brewPrefix}/sbin"];
  environment.variables = {
    HOMEBREW_PREFIX = brewPrefix;
    HOMEBREW_CELLAR = "${brewPrefix}/Cellar";
    HOMEBREW_REPOSITORY = brewPrefix;
    MANPATH = "${brewPrefix}/share/man:$MANPATH:";
    INFOPATH = "${brewPrefix}/share/info:$INFOPATH";
  };
}
