{
  pkgs,
  lib,
  omnibus,
}:
{
  imports = [omnibus.nixosProfiles.presets.coding.python];
  omnibus.coding.python = {
    enableLspBridge = true;
    enableEmacsEaf = true;
    extraPackages =
      ps:
      with ps;
      [
        pytest
        #orgparse
        pytest
        jupyter
        #voila
        pygments
        # orgbabelhelper
        # jupyterlab
        pdftotext
        openai
      ]
      ++ lib.optionals pkgs.stdenv.isLinux [
        # pyqt6
        # pyqt6-webengine
        pyinotify
        pymupdf
        # eaf depencencies
        lxml
      ];
  };
}
