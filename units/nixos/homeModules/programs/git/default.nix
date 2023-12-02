{lib}:
{
  _imports = [./_config.nix];
  _options = {
    hive = with lib; {
      default = mkOption {
        type = types.bool;
        default = true;
        description = "Whether to Enable default profile";
      };
      haskell = lib.mkEnableOption (lib.mdDoc "Whether to Enable Haskell Profile");
      gpg = lib.mkEnableOption (lib.mdDoc "Whether to Enable GPG Profile");
    };
  };
}
