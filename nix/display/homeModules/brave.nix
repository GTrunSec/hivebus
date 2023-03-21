{pkgs, ...}: {
  home.packages = with pkgs; [
    ((brave.override {
        commandLineArgs = [
          "--enable-wayland-ime"
          "--ozone-platform=wayland"
          "--enable-features=UseOzonePlatform"
          "--enable-features=Vulkan"
          # "--use-gl=egl"
        ];
      })
      .overrideAttrs (old: {
        inherit (pkgs.guangtao-sources.brave) src pname version;
      }))
    # google-chrome
  ];
}
