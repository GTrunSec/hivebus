{lib, __inputs__}:
{
  _imports = [./_config.nix];
  _options.hive =
    with lib;
    mkOption {
      default = {};
      type = types.submodule {
        options = {
          swww = mkEnableOption (lib.mdDoc "Whether to enable swww wallpaper profile");
          nvidia = mkEnableOption (lib.mdDoc "Whether to enable nvidia profile");
          autoLogin = mkEnableOption (lib.mdDoc "Whether to enable autoLogin profile");
        };
      };
    };
}
