{pkgs, ...}: let
  package = pkgs.flameshot.overrideAttrs (old: {
    src = pkgs.fetchFromGitHub {
      owner = "flameshot-org";
      repo = "flameshot";

      rev = "3ededae5745761d23907d65bbaebb283f6f8e3f2";
      sha256 = "sha256-4SMg63MndCctpfoOX3OQ1vPoLP/90l/KGLifyUzYD5g=";
    };
    buildInputs = old.buildInputs ++ [pkgs.libsForQt5.kguiaddons];
    cmakeFlags = [
      "-DUSE_WAYLAND_CLIPBOARD=true"
      "-DUSE_WAYLAND_GRIM=true"
    ];
  });
in {
  services.flameshot = {
    enable = true;
    package = pkgs.symlinkJoin {
      name = "flameshot";
      paths = [package];
      buildInputs = [pkgs.makeWrapper];
      postBuild = ''
        wrapProgram $out/bin/flameshot \
          --set XDG_CURRENT_DESKTOP sway
      '';
    };
  };
  home.packages = with pkgs; [
    wl-clipboard
  ];
}
