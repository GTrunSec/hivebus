{pkgs, ...}: {
  home.packages = [
    ((pkgs.brave.override {
        vulkanSupport = true;
      })
      .overrideAttrs (old: {
        inherit (pkgs.guangtao-sources.brave) src pname version;
      }))
  ];
}
