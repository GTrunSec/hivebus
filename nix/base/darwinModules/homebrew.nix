{
  pkgs,
  config,
  lib,
  ...
}: {
  # credit: https://github.com/montchr/dotfield/blob/dd5e577d91b1af7f13909f5dc4343717a718ff02/darwin/profiles/core/default.nix
  homebrew = {
    enable = false;
    onActivation.cleanup = "zap";
    # Use the nix-darwin brewfile when invoking `brew bundle` imperatively.
    global.brewfile = true;
  };
  environment.variables =
    lib.mkIf config.homebrew.enable
    (let
      inherit (config.homebrew) brewPrefix;
    in {
      HOMEBREW_PREFIX = brewPrefix;
      HOMEBREW_CELLAR = "${brewPrefix}/Cellar";
      HOMEBREW_REPOSITORY = brewPrefix;
      MANPATH = "${brewPrefix}/share/man:$MANPATH:";
      INFOPATH = "${brewPrefix}/share/info:$INFOPATH";
    });
}
