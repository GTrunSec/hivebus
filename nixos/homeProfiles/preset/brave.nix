_: {pkgs, ...}: {
  home.packages = with pkgs; [
    ((brave.override {
        commandLineArgs = [
          "--enable-wayland-ime"
          "--ozone-platform=wayland"
          "--enable-features=UseOzonePlatform"
          # "--enable-unsafe-webgpu"
          # "--use-gl=egl"
        ];
      })
      .overrideAttrs (old: {
        inherit (pkgs.guangtao-sources.brave) src pname version;
      }))
    # google-chrome
  ];
}
