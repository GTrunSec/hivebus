{pkgs, ...}: {
  fonts = {
    enableDefaultFonts = true;
    fonts = with pkgs;
      [
        fantasque-sans-mono
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        noto-fonts-emoji
        emojione
        twemoji-color-font
        siji
        unifont
        unifont_upper
        liberation_ttf
        fira-code
        fira-code-symbols
        dina-font
        proggyfonts
        source-han-sans-simplified-chinese
        source-han-sans-traditional-chinese
        material-icons
        weather-icons
        iosevka
        (nerdfonts.override {fonts = ["JetBrainsMono" "RobotoMono"];})
      ]
      ++ [
        material-symbols
      ];

    fontconfig = {
      defaultFonts = {
        serif = ["FantasqueSansMono Nerd Font Mono" "Weibei SC"];
        sansSerif = ["FantasqueSansMono Nerd Font Mono" "Weibei SC"];
        monospace = ["FantasqueSansMono Nerd Font Mono"];
      };
    };
  };
}
