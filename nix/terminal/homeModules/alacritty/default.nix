{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.programs.alacritty;
  CSIuKeyBindings = (builtins.fromTOML (builtins.readFile ./key-bindings.toml)).key_bindings;
in {
  options = {
    programs.alacritty = {
      CSIuSupport = mkEnableOption "Enable CSIu support";
    };
  };

  config = mkMerge [
    (mkIf (cfg.enable && pkgs.stdenv.isLinux) {
      programs.alacritty = {
        settings = {
          key_bindings =
            mkIf cfg.CSIuSupport CSIuKeyBindings;
        };
      };
    })
  ];
}
