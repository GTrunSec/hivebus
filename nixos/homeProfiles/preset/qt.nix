_: {
  config,
  lib,
  pkgs,
  ...
}: {
  qt = {
    enable = true;
    platformTheme = "gtk";
    style.name = "adwaita-dark";
  };
  home.packages = [
    pkgs.qt5.qtwayland
    pkgs.qt6.qtwayland
  ];
  home.sessionVariables = {
    QT_PLUGIN_PATH = "${pkgs.qt5.qtbase.bin}/${pkgs.qt5.qtbase.qtPluginPrefix}";
    QT_QPA_PLATFORM_PLUGIN_PATH = "${pkgs.qt5.qtwayland.bin}/${pkgs.qt5.qtbase.qtPluginPrefix}";
  };
}
