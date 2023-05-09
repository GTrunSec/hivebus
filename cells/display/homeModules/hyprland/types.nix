{lib}:
with lib; {
  wayland.windowManager.hyprland = {
    hiveProfiles = mkOption {
      default = {};
      type = types.submodule {
        options = {
          greetd = mkEnableOption (lib.mdDoc "Whether to enable greetd profile");
          getty = mkEnableOption (lib.mdDoc "Whether to enable getty profile");
          displayManager = mkEnableOption (lib.mdDoc "Whether to enable displayManager profile");
          nvidia = mkEnableOption (lib.mdDoc "Whether to enable nvidia profile");
          autoLogin = mkEnableOption (lib.mdDoc "Whether to enable autoLogin profile");
          user = mkOption {
            type = types.str;
            default = "hyprland";
            description = "Name of the user";
          };
        };
      };
    };
  };
}
