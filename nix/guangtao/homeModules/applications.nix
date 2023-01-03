{pkgs, ...}: {
  home.packages = [
    (
      pkgs.writeShellScriptBin "logseq-run" ''
         export XDG_DATA_DIRS=${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}:${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}:$XDG_DATA_DIRS
        ${pkgs.appimage-run}/bin/appimage-run ${pkgs.guangtao-sources.logseq.src}
      ''
    )
  ];
}
