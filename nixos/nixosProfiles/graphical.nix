{
  self,
  root,
}: {
  default = [
    {
      programs.dconf.enable = true;
    }
    root.preset.audio.pipewire
    root.preset.audio.bluetooth
    root.preset.display.xdg
  ];

  full = [
    self.default
    root.preset.display.fcitx5
    root.preset.display.dbus
  ];
}
