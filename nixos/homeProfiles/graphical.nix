{
  self,
  root,
}: {
  default = [
    root.preset.qt
    root.preset.gtk
  ];

  full = [
    self.default
    root.preset.rofi.default
    root.preset.kanshi.default
  ];

  wayland = [
    self.full
    root.preset.hyprland.default
    root.preset.rofi.default
    root.preset.waybar.default
  ];
}
