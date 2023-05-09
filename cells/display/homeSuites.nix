{
  inputs,
  cell,
}: let
  inherit (cell) homeProfiles homeModules;
in {
  guangtao = [
    homeProfiles.hyprland.guangtao
    # homeProfiles.hyprpaper.guangtao
    homeProfiles.kanshi.guangtao
    homeProfiles.rofi-wayland.guangtao
    homeProfiles.eww.guangtao
    homeProfiles.waybar.guangtao

    homeModules.gtk
    homeModules.qt
    homeModules.kanshi
    homeModules.wayland
  ];
}
