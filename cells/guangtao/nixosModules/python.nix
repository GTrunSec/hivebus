{
  pkgs,
  lib,
  ...
}: let
  my-python-packages = (
    pkgs.python3Override.withPackages (
      ps:
        with ps;
          [
            #emacs-eaf
            shapely
            dbus-python
            qrcode
            xlib
            grip
            black
            keyring
            # pyqt5
            # pyqtwebengine
            markdown
            feedparser
            retrying
            epc
            orjson
            ###
            pytest
            #orgparse
            pytest
            jupyter
            #voila
            pygments
            # orgbabelhelper
            # jupyterlab
            pdftotext
            pypinyin
            openai
            sexpdata
            six
            python-lsp-server
          ]
          ++ lib.optional pkgs.stdenv.isLinux [
            pyqt6
            pyqt6-webengine
            pyinotify
            pymupdf
          ]
    )
  );
  #.override (args: {ignoreCollisions = true;});
in {
  environment.systemPackages = with pkgs;
    [
      my-python-packages
      nodePackages.pyright
      poetry
      (pkgs.writeScriptBin "py" ''
        ${pkgs.mind-wave}/bin/python3 "$@"
      '')
    ]
    ++ lib.optionals pkgs.stdenv.isLinux [
      # promnesia
      # orgparse
    ];
}
