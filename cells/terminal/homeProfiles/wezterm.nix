{
  inputs,
  cell,
}: let
  inherit (inputs) std self;
  inherit (inputs.cells.common.lib) __utils__;

  src = "${(std.incl self ["profiles/wezterm"])}/profiles/wezterm";
in {
  default = {
    imports = [cell.homeModules.wezterm];
    home.file.".config/wezterm/catppuccin.lua".source = __utils__.catppuccin-wezterm + "/catppuccin.lua";
    home.file.".config/wezterm/wezterm.lua".source = "${src}/wezterm.lua";
  };
}
