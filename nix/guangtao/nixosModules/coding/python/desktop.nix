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
            #voila
            pygments
            # orgbabelhelper
            # jupyterlab
            pdftotext
            pypinyin
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
  environment.systemPackages = with pkgs; [
    my-python-packages
    nodePackages.pyright
    promnesia
    orgparse
    (
      let
        wenPy = pkgs.python3Override.withPackages (
          ps:
            with ps; [
              pygls
              pypinyin
              jieba
            ]
        );
        wenEnv = pkgs.runCommand "wenEnv" {} ''
          mkdir -p $out/completion
          cp -r ${pkgs.guangtao-sources.GodTian_Pinyin.src}/* $out/completion
          cp -r ${pkgs.guangtao-sources.wen.src}/* $out/
          cd $out/completion && ${lib.getExe pkgs.git} apply ../0001-for-py3.patch
        '';
      in
        pkgs.writeShellScriptBin "wenls" ''
          ${wenPy}/bin/python3 ${wenEnv}/server.py
        ''
    )
  ];
}
