{lib}: {
  _options = with lib; {
    wayland = mkEnableOption (lib.mdDoc "Whether to enable wayland profile");
  };
}
