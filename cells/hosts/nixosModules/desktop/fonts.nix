{
  enableDefaultPackages = true;
  fontconfig = {
    defaultFonts = {
      serif = [
        "FantasqueSansMono Nerd Font Mono"
        "Weibei SC"
      ];
      sansSerif = [
        "FantasqueSansMono Nerd Font Mono"
        "Weibei SC"
      ];
      monospace = [ "FantasqueSansMono Nerd Font Mono" ];
    };
  };
  _imports = [
    (
      { pkgs, ... }:
      {
        fonts.packages =
          with pkgs;
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
            roboto
            (nerdfonts.override {
              fonts = [
                "JetBrainsMono"
                "RobotoMono"
              ];
            })
          ]
          ++ [ material-symbols ]
        ;
      }
    )
  ];
}
