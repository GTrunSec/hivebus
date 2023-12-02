{lib}:
{
  _imports = [./_config.nix];
  _options = {
    CSIuSupport = lib.mkEnableOption "Enable CSIu support";
  };
}
