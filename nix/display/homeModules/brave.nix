{pkgs, ...}: {
  home.packages = with pkgs; [
    ((brave.override {
        vulkanSupport = true;
        commandLineArgs = [
          "--enable-wayland-ime"
          "--ozone-platform=wayland"
          "--enable-features=UseOzonePlatform"
          # "--use-gl=egl"
        ];
      })
      .overrideAttrs (old: {
        inherit (pkgs.guangtao-sources.brave) src pname version;
      }))
    # google-chrome
  ];
}
