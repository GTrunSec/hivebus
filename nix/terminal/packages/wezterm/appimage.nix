{
  lib,
  stdenv,
  fetchurl,
  appimageTools,
  guangtao-sources,
}: let
  pname = "wezterm";
  appimageContents = appimageTools.extractType2 {
    inherit pname;
    inherit (guangtao-sources.wezterm-appimage) version src;
  };
in
  appimageTools.wrapType2 rec {
    inherit pname;
    inherit (guangtao-sources.wezterm-appimage) version src;

    extraPkgs = pkgs:
      with pkgs; [];

    extraInstallCommands = ''
      mv $out/bin/${pname}-${version} $out/bin/${pname}
      install -m 444 -D ${appimageContents}/${pname}.desktop $out/share/applications/${pname}.desktop
      substituteInPlace $out/share/applications/${pname}.desktop \
        --replace 'Exec=AppRun' 'Exec=${pname}'
    '';
  }
