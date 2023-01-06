{pkgs, ...}: {
  home.packages = with pkgs; [
    tdesktop
    zoom-us
    slack
    discord
    element-desktop
    signal-desktop
  ];
}
