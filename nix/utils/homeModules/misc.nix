{pkgs, ...}: {
  services.flameshot = {
    enable = true;
    package = pkgs.symlinkJoin {
      name = "flameshot";
      paths = [pkgs.flameshot];
      buildInputs = [pkgs.makeWrapper];
      postBuild = ''
        wrapProgram $out/bin/flameshot \
          --set XDG_CURRENT_DESKTOP sway
      '';
    };
  };
  home.packages = with pkgs;[
    wl-clipboard
  ];
}
