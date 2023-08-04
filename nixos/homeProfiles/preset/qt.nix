_:
{
  config,
  lib,
  pkgs,
  ...
}:
{
  qt = {
    enable = true;
    platformTheme = "gtk";
    style.name = "adwaita-dark";
  };
  home.packages = [ pkgs.libsForQt5.qtwayland ];

  home.sessionVariables = {
    # QML2_IMPORT_PATH = "/run/current-system/sw/" + pkgs.qt5.qtbase.qtQmlPrefix;
    QT_PLUGIN_PATH = "${pkgs.qt5.qtwayland}/${pkgs.qt5.qtbase.qtPluginPrefix}";
  };
}
