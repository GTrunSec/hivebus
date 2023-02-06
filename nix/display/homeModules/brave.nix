{pkgs, ...}: {
  home.packages = with pkgs; [
    ((brave.override {
        vulkanSupport = true;
      })
      .overrideAttrs (old: {
        inherit (pkgs.guangtao-sources.brave) src pname version;
      }))
    # gtk4
    # google-chrome
  ];
}
