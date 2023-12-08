{pkgs}:
{
  fonts.fontDir.enable = true;
  fonts.fonts = with pkgs; [
    (nerdfonts.override {
      fonts = [
        "JetBrainsMono"
        "RobotoMono"
      ];
    })
  ];
}
