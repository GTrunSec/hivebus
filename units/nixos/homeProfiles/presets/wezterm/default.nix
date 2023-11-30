{
  config,
  lib,
  pkgs,
  ...
}:
let
  src = inputs.dotfiles + "/wezterm";
in
{
  config =
    with lib;
    mkMerge [
      {
        # home.file.".config/wezterm/catppuccin.lua".source =
        #   __utils__.catppuccin-wezterm + "/catppuccin.lua";
        home.file.".config/wezterm/wezterm.lua".source = "${src}/wezterm.lua";
      }
    ];
}
